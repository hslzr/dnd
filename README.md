# README

* Ruby 3.1.2

* PostgreSQL 1.1

* Tailwind CSS

The seed file is all-important

# Working Notes
sheet.hrml.erb => sheet_controller
  turbo-frame form => dropdown#submit
    select-box => sheet#categoryHandler
    select-box => data-sheet-url-param

  dropdown#submit
    this populates the instance variables server side for conditional select_box contents on turbo-frame submit

  sheet#catHandler
    -updates this.choices state object
    -if select_box != label
      catUpdate with category data(Race/Class/etc.)
    -else
      catUpdate with no data

  sheet#catUpdate(data, cat_type)
    -set targets for feature/trait/skill assignment by category and update category specific information that doesn't rely on other select_boxes

    -if cat_type != 'level'
      populateCatAbilities(data, //targets from above)
        -resets and populates these fields

    -if choices is full and stats assigned
      finalPass() //final sheet calculations assuming all user entered data is present

  sheet#finalPass()
    -setSkillMap()
    -populateSkillModifiers()
    -set a few substats and tracking stats
    -customModifiers()
      not written yet, this is for implementing class features that modify data

  sheet#populateCatAbilities(data, //targets)
    takes fetched data and puts it to the sheet at the given targets with putList()

  the rest are utility functions to manipulate the data and are fairly short. The only complicated thing is setSkillMap() which sets a bunch of targets for skill modifiers. This is called in finalPass, then we call setSKillModifiers which sets all the proficiency modifiers, the four lines using this.skills live here at the end


Bugs:
need to handle reset on selection of empty category, e.g. from Acolyte to - Background -

//
I have to track everything in JS and on the sheet, so in some places I use the sheet instead of 
an instance variable in the controller. I should pick one and stick with it, and it should 
probably be several larger Maps in JS rather than relying on the DOM

THe largest code burdens are on modals for language and proficiency choices
on proficiencies I'm using innerText as bools essentially and that can't be right
