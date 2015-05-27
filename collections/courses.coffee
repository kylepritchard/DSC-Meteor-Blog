Schemas = {}

@Courses = new Mongo.Collection('courses')

Courses.attachSchema new SimpleSchema(

    title:
        type: String
        optional: true

    startdate:
        type: Date
        label: 'Start Date'
        optional: true
        autoform:
            type: "bootstrap-datepicker"

    enddate:
        type: Date
        label: 'End Date'
        optional: true
        autoform:
            type: "bootstrap-datepicker"

    starttime:
        type: String
        label: 'Start Time'
        optional: true
        autoform:
            type: "bs-timepicker"

    endtime:
        type: String
        label: 'Start Time'
        optional: true
        autoform:
            type: "bs-timepicker"

    coursetype:
        type: String
        label: 'Course Type'
        optional: true
        autoform:
            type: "select"
            options: ->
                coursetypes = CourseTypes.find()
                options = coursetypes.map (coursetypes) ->
                    label: coursetypes.title
                    value: coursetypes._id
                options
            firstOption: false

    additional:
        type: String
        label: 'Additonal Information (if required)'
        optional: true

    postdate:
        type: Date
        label: 'Post Date'
        optional: true

    coursetitle:
        type: String
        label: 'Course Title'
        optional: false

    coursedescription:
        type: String
        label: 'Course Description'
        optional: true

    courserequirements:
        type: String
        label: 'Course Requirements'
        optional: true

    courseduration:
        label: 'Course Duration (Days)'
        type: Number
        optional: true

    courseminduration:
        type: Number
        label: 'Course Minimum Duration (Days)'
        optional: true

    courseassumedknowledge:
        type: String
        label: 'Assumed Knowledge prior to taking course'
        optional: true

    coursedifficulty:
        type: Number
        label: 'Course Difficulty Rating'
        optional: true

    coursecostmember:
        type: Number
        label: 'Member Cost (£)'
        optional: false
        min: 0
        autoform:
            afFieldInput:
                class: 'money'

    coursecostnonmember:
        type: Number
        label: 'Non Member Cost (£)'
        optional: false
        min: 0
        autoform:
            afFieldInput:
                class: 'money'

    )
