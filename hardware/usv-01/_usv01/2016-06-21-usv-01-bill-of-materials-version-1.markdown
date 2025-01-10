---
layout: post
title: "USV-01 Bill of Materials (version 1)"
date: 2016-06-21 11:33
comments: true

---

This is the bill of materials the first version of the USV-01 build:

<table border="1">
  <thead>
    <tr>
      <th><strong>#</strong></th>
      <th><strong>Item</strong></th>
      <th><strong>Unit Price / £</strong></th>
      <th><strong>Unit Mass / kg</strong></th>
      <th><strong>Qty</strong></th>
      <th><strong>Total Price / £</strong></th>
      <th><strong>Total Mass / kg</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td><a href="https://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=81594">HobbyKing Marine Scott Free Offshore Racing Deep V Racing Boat 730mm ARR</a></td>
      <td>108.57</td>
      <td>1.2</td>
      <td>1</td>
      <td>108.57</td>
      <td>1.2</td>
    </tr>
    <tr>
      <td>2</td>
      <td><a href="https://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=28996">Turnigy 4000mAh 2S 30C Lipo Pack</a></td>
      <td>12.86</td>
      <td>0.254</td>
      <td>2</td>
      <td>25.72</td>
      <td>0.508</td>
    </tr>
    <tr>
      <td>3</td>
      <td><a href="http://www.hobbyking.com/hobbyking/store/__41608__FrSky_X8R_8_16Ch_S_BUS_ACCST_Telemetry_Receiver_W_Smart_Port.html">FrSky X8R 8/16Ch S.BUS ACCST Telemetry Receiver W/Smart Port</a></td>
      <td>22.87</td>
      <td>0.017</td>
      <td>1</td>
      <td>22.87</td>
      <td>0.017</td>
    </tr>
    <tr>
      <td>4</td>
      <td><a href="https://shop.pimoroni.com/products/raspberry-pi-3">Raspberry Pi 3</a> &lowast;</td>
      <td>32.00</td>
      <td>0.045</td>
      <td>1</td>
      <td>32.00</td>
      <td>0.045</td>
    </tr>
    <tr>
      <td>5</td>
      <td><a href="http://www.goodluckbuy.com/cjmcu-108-apm-2-6-flight-controller-gps-6m-hmc5883l-compass-module-for-multi-rotors.html?¤cy=gbp">CJMCU uBlox 6M GPS &amp; HMC5883L Compass module</a></td>
      <td>9.66</td>
      <td>0.02</td>
      <td>1</td>
      <td>9.66</td>
      <td>0.02</td>
    </tr>
    <tr>
      <td>6</td>
      <td><a href="http://electronics.chroma.se/usbsb.php">USB Servo Board</a> &lowast;&lowast;</td>
      <td>15.47</td>
      <td>0.01</td>
      <td>1</td>
      <td>15.47</td>
      <td>0.01</td>
    </tr>
    <tr>
      <td>7</td>
      <td><a href="https://www.amazon.co.uk/Edimax-EW-7711UAN-Wireless-nLITE-Adapter/dp/B001KOTDDU/ref=pd_cp_147_2?ie=UTF8&amp;refRID=97R3K55A3CGVZZ6M8X7B">Edimax EW-7711UAN Wireless nLITE High Gain USB Adapter</a></td>
      <td>17.87</td>
      <td>0.03</td>
      <td>1</td>
      <td>17.87</td>
      <td>0.03</td>
    </tr>
    <tr>
      <td>8</td>
      <td><a href="https://www.pololu.com/product/2806">Pololu 4-Channel RC Servo Multiplexer</a></td>
      <td>6.86</td>
      <td>0.01</td>
      <td>1</td>
      <td>6.86</td>
      <td>0.01</td>
    </tr>
    <tr>
      <td> </td>
      <td> </td>
      <td> </td>
      <td><strong>Total:</strong></td>
      <td> </td>
      <td><strong>239.02</strong></td>
      <td><strong>1.84</strong></td>
    </tr>
  </tbody>
</table>

<br/>&lowast; I'm using a Raspberry Pi 2 in my build because I had one lying around, but if you're starting from scratch there's no reason not to go for version 3. Note that while the Raspberry Pi 3 has on-board WiFi, its antenna is tiny, so I would recommend using a WiFi USB dongle with a large antenna anyway.

&lowast;&lowast; Currently, my build is slightly different in that it uses the GPIO-mounted version of this, not the USB version. The disadvantage of this is that it takes up the Pi's UART, so a separate USB to UART adapter (CP2102) is required to communicate with the GPS. This is just because I had the bits lying around so could save some money&mdash;if starting from scratch, I would use the part listed here.
