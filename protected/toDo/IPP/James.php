**Test Push 08:53
Please pull latest DB: DB 2013-07-11b

I have created the Bid window email (Title: Bid Window Phase 1 Email; name: bidWindowFormEmail) under widget console->Root 
We only need to replace the ::username:: for now but the system might require custom fields in the future.

Edit widget. After clicking on submit the popup doesn't close. Can close it manually but then edit widget doesn't work anymore.
Widget console is doing the same if I submit content.

Form Builder
<!------------->

Summary | Print | Lock | Delete (Public Form actions)
Validation rules; 
    GNumericField  added max (180) and min (-180) to root of fields but getting following error:
        include(180.php): failed to open stream: No such file or directory (/home/ali/yii/framework/YiiBase.php:423)
        
Compare;

page/form/index [Form Admin List page]
    Can't edit or create Forms.
    
GPS Field Widget (you mentioned, dont have to do this now but look into this)
    GPS data has 6 fields so creating 6 entries in the DB using the 'name' infront followed by generic machine names.
    
    example: Please provide GPS Coordinates of the project site
        name: projectSite
        class name: GGps (widget)
        Title: Coordinates of the project site [View: <div class="alert alert-info">Coordinates of the project site</div> ]
        
        DB Table Creation: projectSiteLongitudeDegrees; projectSiteLongitudeMinutes; projectSiteLongitudeSeconds; projectSiteLatitudeDegrees; projectSiteLatitudeMinutes; projectSiteLatitudeMinutes
        
        View: <div class="GPSHeader"><span>Degrees</span><span>Minute</span><span>Seconds</span></div>
              <label class="label-GPS">Longitude</label>projectSiteLongitudeDegrees; projectSiteLongitudeMinutes; projectSiteLongitudeSeconds;(all inline)<span>East</span>
              <div></div>
              <label class="label-GPS">Latitude</label>projectSiteLatitudeDegrees; projectSiteLatitudeMinutes; projectSiteLatitudeMinutes (all inline)<span>South</span>
         
        Validation: Degrees (-180 - 180) Minutes (0 - 60) Seconds (0 - 60)
        
              
Clear button on forms put blank values on dropdowns can set to 'Please select' (not that serious)

recursive deleting on nests GList / Sub forms when deleting the main form isn't happening.

Please check this. Changed redirect in formController.php line 61-62
    //if(!$tdata->validate($page)) $this->redirect("/form/$model->name/$page->name/".$tdata->id);
    if($tdata->validate($page)) $this->redirect("/form/$model->name/$page->name/".$tdata->id);

Dashboard
---------------

Project Leaders (paid membership users) get a membership code that they can provide to their team leaders.
Unpaid for users get a link to submit this code.
Project Leaders have to approve team member requests, provide the same info as the manage membership system 
(Name | Organisation | Email | Activate)


Manage Membership List
<!----------->
The current list only outputs pending / unconfirmed members. Please create another view to display all existing / confirmed members. 
    [[Charging to develop this R500]]
    


Back Burn
<!----------->
Registration:
    When sumbitting a invalid registeration form scroll to top of the form
    
/home/ali/haw-cms/protected/views/layouts/cssfiles.php not being included or in theme directory