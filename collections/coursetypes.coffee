@CourseTypes = new Mongo.Collection('coursetypes')

Schemas = {}

CourseTypes.attachSchema new SimpleSchema(

  title:
    type: String
    label: 'Course Title'
    optional: false


  coursetype:
    type: String
    label: 'Course Type'
    optional: true
    autoform:
      type: "select-radio-inline"
      class: 'option-input radio'
      options: ->
        [
          {
            label: 'Junior'
            value: 'Junior'
          }
          {
            label: 'Youth'
            value: 'Youth'
          }
          {
            label: 'Adult'
            value: 'Adult'
          }
          {
            label: 'Powerboat'
            value: 'Powerboat'
          }
          {
            label: 'Shore Based'
            value: 'Shore Based'
          }

        ]

  coursedescription:
    type: String
    label: 'Course Description'
    optional: true
    autoform:
      afFieldInput:
        type: 'redactor'
        buttons: ['bold', 'italic',
          'unorderedlist', 'orderedlist', 'outdent', 'indent'
        ],
        minHeight: 100,
        toolbarFixed: true,
        toolbarFixedTarget: '.redactor-box'

  courserequirements:
    type: String
    label: 'Course Requirements'
    optional: true
    autoform:
      afFieldInput:
        type: 'redactor'
        buttons: ['bold', 'italic',
          'unorderedlist', 'outdent', 'indent'
        ],
        minHeight: 100,
        toolbarFixed: true,
        toolbarFixedTarget: '.redactor-box'

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
    autoform:
      afFieldInput:
        type: 'redactor'
        buttons: ['bold', 'italic',
          'unorderedlist', 'outdent', 'indent'
        ],
        minHeight: 100,
        toolbarFixed: true,
        toolbarFixedTarget: '.redactor-box'

  coursedifficulty:
    type: Number
    label: 'Course Difficulty Rating'
    optional: true

  # coursefile:
  #     type: String
  #     label: 'Course Info File'
  #     optional: true
  #     autoform:
  #         afFieldInput:
  #             type: "file"

  postdate:
    type: Date
    optional: false

  username:
    type: String
    label: 'Username'
    optional: true

  author:
    type: String
    label: 'Author'
    optional: true
  )
