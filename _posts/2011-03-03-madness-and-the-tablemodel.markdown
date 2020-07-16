---
author: Ian
comments: true
date: 2011-03-03 14:26:30
layout: post
slug: madness-and-the-tablemodel
title: Madness and the TableModel
wordpress_id: 11492
categories:
- Software
tags:
- Code
- Confusion
- Design Patterns
- Geeky
- madness
- Programming
- Software
- Ugly Hacks
- WTF
---

_What follows is a lengthy rant about a particularly annoying situation in some of my code.  Programmers, please let me know - is it the toolkit that is mad, or is it me?  Everyone else, feel free to skip it!_ `:)`

For one of my current [Java](http://www.java.com/) projects, I am using a toolkit that comes with its own complete set of GUI widgets based on [Swing](http://en.wikipedia.org/wiki/Swing_(Java)).  Swing... and horror.

I was under the impression that managing a table in any sane OO language goes a bit like this:

  1. Create a class that roughly represents, or at least holds the data for, a row of the table.

  2. Create a "Table Model" or some other kind of backing array to hold objects of that class.

  3. Create a Table widget that uses the table model as its data source.

  4. Happily filter and sort away, knowing that the model and the view are completely separate entities.

And if you should want to serialise the data behind the table to disk, and load it again, you can just save and reload the model, then call some update method on the table itself to let it know that the model has changed.

Bring on the horror!

What this toolkit does, allegedly in the name of [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller), is this:

  1. Create a class that roughly represents, or at least holds the data for, a row of the table.

  2. Create a "Table Model", but completely ignore it.

  3. Name the columns of the table after the _internal member variables_ of the class you have created.

  4. Add each object to the table in turn, watching in agony as it extracts the values of those member variables, and puts them into the table as Strings, discarding the original object in the process.

But wait, what if those member variables are (sensibly) private?  Oh, no worries.  It uses _reflection_, each and every time you add an object to the table, to figure out what the getter method for that variable is called.

And then we come to wanting to serialise the data to disk.  Well, that could be a problem - the table doesn't contain the objects we want, only Strings.  Oh, no worries.  You can give the table a new instance of your object, have it figure out (again, at runtime) which the appropriate _setter_ methods are, and run those to make your object again!

Oh, hey, I hope that object didn't contain any variables that weren't in the table.  'Cos if so, you're not getting them back.

Luckily in my case, everything I care about _is_ shown in the table, which only leaves the attempt to serialise it.

Now I want to have a single class that nicely encapsulates this serialising business for all tables, regardless of what the objects expressed in that table are.  Normally, one could just serialise the `TableModel` and be done with it, but now we need to dynamically re-make the objects based on what's in the table.

For a fully encapsulated solution, I really want to be able to just pass in the table and have the serialiser take care of the difficult stuff.  i.e. I want to call:

    
    if (fc.showSaveDialog(this) == JFileChooser.APPROVE_OPTION) {
        SerialisedTableFile f = new SerialisedTableFile(fc.getSelectedFile());
        f.save(table);
    }

But I can't, because `f.save()` now has no idea what kind of object it is supposed to be building.  So we need to pass `f.save()` a template object of the class that it is supposed to be building, the only requirement of which is that it can be cloned to produce the real object that we want to store data from the table in.  So we implement the `Cloneable` interface -- except that `Cloneable` doesn't actually include `clone()` for some no-doubt genius reason.  (Not sarcasm, I really do suspect that language designers are an order of magnitude more intelligent than I.)

The end result of all this is that I now have an interface that delights in the name `ReallyCloneable`, which all classes that I wrangle into tables have to implement.  And poor old `f.save()` looks like this:

    
    public boolean save(Table table, ReallyCloneable itemTemplate) {
        boolean success = false;
        try {
            if (file.exists()) {
                file.delete();
            }
            if (file.createNewFile()) {
                ArrayList<Object> items = new ArrayList<Object>();
                for (int i = 0; i < table.getRowCount(); i++) {
                    try {
                        Object o = itemTemplate.clone();
                        table.getItemFromRow(o, i);
                        items.add(o);
                    } catch (NoSuchMethodException ex) {
                        Logger.getLogger(SerialisedTableFile.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InvocationTargetException ex) {
                        Logger.getLogger(SerialisedTableFile.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(file));
                out.writeObject(items);
                out.close();
                success = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(SerialisedTableFile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return success;
        }
    }

I think it's about time I started buying [Bad Code Offsets](http://codeoffsets.com/Buy.aspx) by Direct Debit.
