Ui tweak suggestions:


video conversion works, can we have a fullscreen button?
[Made one for http://video.projects.cloudns.org/? can you use that]

on ff (dont know about other browsers right now) there is a 1px gap under the play progress bar
the music player looks a little jumbled up, can you perhaps help advise on what is causing it? (I'll also investigate)
(see snapshot3.png in todo)




Remove seamonkey and its conflicting NSS libs:

removepkg seamonkey
removepkg seamonkey-solibs

Install new nss libs from mozilla

wget http://www.slackware.com/~alien/slackbuilds/mozilla-nss/pkg/13.37/mozilla-nss-3.16-i486-1alien.txz

installpkg ./mozilla-nss-3.16-i486-1alien.txz

Download for chrome-debian to chrome-slackware package converter.

wget ftp://carroll.cac.psu.edu/pub/linux/distributions/slackware/slackware-13.37/extra/google-chrome/google-chrome.SlackBuild