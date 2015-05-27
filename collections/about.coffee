Schemas = {}

@About = new Mongo.Collection('about')

About.attachSchema new SimpleSchema(

    title:
        type: String
        label: 'Title'
        optional: false

    content:
        type: String
        label: 'Post Content'
        optional: true
        autoform:
            afFieldInput:
                type: 'redactor'
                buttons: ['bold', 'italic',
                    'unorderedlist', 'orderedlist', 'outdent', 'indent'
                ],
                minHeight: 400,
                toolbarFixed: true,
                toolbarFixedTarget: '.redactor-box'

    username:
        type: String
        label: 'Username'
        optional: true

    simpletitle:
        type: String
        label: 'Simple Title'
        optional: true

    postdate:
        type: Date
        label: 'Post Date'
        optional: true

    postUrl:
        type: String
        label: 'Post Url'
        optional: true

    author:
        type: String
        label: 'Author'
        optional: true

    )
