# slotify
notifies you when an evaluation slot appears on the 42 intra

Before using this script, you'll need to generate your cookie file.
To do so : 
 > connect to the intra

 > inspect element

 > network

 > refresh

 > copy first element as curl

 > in shell, in slotify folder, `[ctrl+v] --cookie-jar cookie`
 
And then, use `./correc.sh [link to slot page]`

Enkoy

Oh, btw it uses `notify-send` , which is available for ubuntu, I'm not sure if it will work on other distribs.

Also you'll need xmllint that is available through `apt install libxml2-utils` if I'm not mistaken
