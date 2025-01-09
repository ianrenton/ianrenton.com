---
author: Ian
comments: true
date: 2010-02-06 20:43:40
layout: post
slug: breaking-out-of-twitter
title: Breaking Out of Twitter
wordpress_id: 2700
categories:
- Internet
- Software
tags:
- Application
- Brainstorm
- Ideas
- Internet
- Service
- Suggestion
- Twitter
- Web
---

Earlier this evening, [@HolyHaddock](http://www.twitter.com/HolyHaddock) linked to an entry on [Brian Hurt](http://enfranchisedmind.com/blog/posts/author/bhurt-aw/)'s blog entitled ["Why I Quit Twitter"](http://enfranchisedmind.com/blog/posts/why-i-quit-twitter/).  In it, he argues for his leaving [Twitter](http://twitter.com/) on the grounds that it is not a good place for debate and extended discussion:

> If you want to debate me, I’m open to it.  But for the debate to not be pointless, that means it has to be held somewhere where ideas can be explored and complex arguments can be presented.  In email, in blog posts, in comments, somewhere where there is room.
> 
> 

[![Twitter Conversation Thread](/img/blog/2010/02/twitterconvo-158x300.png)](/blog/2010/02/twitterconvo.png)

Which is fair enough.  I would argue that Twitter has every right to be bad at conversation -- that's not what it was created for.  Once upon a time, it asked a simple question: "What are you doing?".  The user base has shaped Twitter over the years, most notably in the formalisation of @usernames and #tags which began simply as trends among users.  But it has stuck resolutely to its 140-character limit, without which I think the service would change for the poorer.

I have no real argument with Brian Hurt here -- his reason for leaving is a fine one, and he's certainly not suggesting anyone else should necessarily leave for that reason.  Personally, I didn't come to Twitter for extended conversation, and I won't be leaving for the lack of it.

But ironically @HolyHaddock and I did discuss this problem on Twitter, and it was probably not long before the conversation became annoying to those that follow us both.  (To double up the irony, I was also using a [pastebin](/software/twixt) to reply in more than 140 characters.)

I think the real issue here is that although Twitter does not well support conversations, people tweet things that are likely to start conversations, and there is no real way to _break out_ of Twitter once the conversation has started.  If we assume that Twitter has no intention of allowing long -- even infinite-length -- replies, then if there is to be any way to 'break out', it must be through another service.

Now the friendliness of the [Twitter API](http://apiwiki.twitter.com/) makes it very easy for other sites to integrate with Twitter, allow users to sign in with their Twitter credentials, and pull tweets across for display.  But as I see it, there are a few issues that would need to be resolved with a potential service:

  * **Pulling Across.**  If a conversation starts across multiple tweets, these would need to be pulled across to a 'break out' conversation so that things already said don't have to be re-said.  It's easy to identify the tweet that started it all, but no way in the API to find all replies to it.  Starting from the most recent reply, one can find what _it_ is in reply _to_ and follow the thread all the way up, but if the conversation has branched, you wouldn't capture it all.

  * **Branching vs Single-Threading.**  Multiply-branching threads aren't too much of a problem on Twitter, but displaying them properly may become an issue on the 'break out' service.  Reducing everything to a single thread -- blog comment style -- is the alternative, but this could lead to some very confusing conversations, not least if some users' tweets are protected and thus not visible to certain other users.

  * **Reporting Back.**  Should anything be passed back to Twitter to let other users know where the conversation is continuing?  How would we do that in a way that's informative but not spammy?  Should we instead rely on the user that 'broke out' to let the others know?

  * **Permanence.**  Would there be a slight mistrust of the 'break out' service, meaning that users would prefer not to use it in case it disappears from the face of the 'net tomorrow?  How would we overcome this, and how would we allow users to create some permanent archive (e.g. download) of the 'broken out' thread in case they have discussed something meaningful and worth keeping?

  * **Wave.**  Someone _must_ have already done a [Google Wave](http://wave.google.com) bot that will pull in tweets and let people do this, surely?

  * **Popularity.**  How would we let people know that this service exists, and how popular would it be -- how many people want this kind of service?  (Many could be as much of a problem as few.)

Tagging onto the Google Wave point, _is_ there a service like this that already exists, in Wave or otherwise?  Any thoughts, oh great interweb hive-mind?


