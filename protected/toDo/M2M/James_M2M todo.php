--------------------
New changes
--------------------

Loading a direct link or clicking forward or backwards (in browser navigation) doesn't make the correct tab active.


ALL file types:
    Is there a way to rename files, was this included as a feature?

M2M, and all websites, by design, may or may not have to specifically deal with filenames. This is still a decision that is being made.
Yes files have names, and these names could be tracked, but it is wrong to assume that files have names and drive any type of data
from it.

When M2M provides a download, the file name should not be at all based on what the file name was. There is no reason to manage any of the post
content around what the file was called, some files have double extensions/bad filenames etc. M2M has to drive its filing by what it knows ABOUT
the file, so the filename of a video is actually the one peice of information it always has, the id number. The id number gets hashed and files
get stored based on that hash. The original filename in terms of content is never relevent unless we are using it to establish a default name,
the problem with default naming is that you pollute the content with names that never got changed. The ideal situation is where the system, once it has
processed the file, then at the soonest opportunity asks you to define the files information, in a screen that displays its original filename, for the person who uploaded
as a visual reference (if it has one).

it would not make sense for the system to base
any of its data on the filename except to keep it as a reference for the uploading user to see. My intention is to make them editable, and when you edit
them you can see the file name.

I also intent to later include the function to override the output filename with a custom one, so that the uploader
can say when someone downloads this file it should have that name.

only using it will tell if we need additional visual indicators

Music file type:
    Cue ALL button is not working

Video file type:
    Error when viewing item (magnifying glass)


 
    Need a cancel button for uploads?
    
Music Player:


    Is there a way to define jp_poster / cover size? They normally square. currently they are picking up the video's config.  I see there is .jp-video-270p on .GPlayer. We can toggle it with a class? 
    Loaded video's don't have their filenames included. They all say 'video'
    
_______________________________________________________________________
    
    (RESOLVED/CAN NOT REPLICATE)

    Error when uploading:

http://www.music2media.local/index.php#page/upload (livescores aswell)

    View: please make <div class="jp-full-screen glyphicon glyphicon-fullscreen glyphicon-2x"></div> a <a class="jp-full-screen glyphicon glyphicon-fullscreen glyphicon-2x"></a> 

    Posts / Upload
    Uploading multiple images give you the image cover art popup for each image. eventually the screen goes blank.
