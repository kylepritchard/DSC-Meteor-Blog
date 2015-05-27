Schemas = {}

@Training = new Mongo.Collection('training')

Training.attachSchema new SimpleSchema(

    title:
        type: String
        label: 'Title'
        max: 200
        optional: false

    content:
        type: String
        label: 'Post Content'
        optional: true
        autoform:
            afFieldInput:
                type: 'redactor'
                plugins: ['imagemanager'],
                buttons: ['html', 'formatting', 'bold', 'italic', 'deleted',
                    'unorderedlist', 'orderedlist', 'outdent', 'indent',
                    'image', 'file', 'link', 'alignment', 'horizontalrule'
                ],
                imageUpload: '/upload_image',
                imageManagerJson: '/image_manager.json',
                minHeight: 300,
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

    comments:
        type: Object
        label: 'Comments'
        optional: true

    )
