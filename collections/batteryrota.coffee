Schemas = {}

@BatteryRota = new Mongo.Collection('batteryrota')

BatteryRota.attachSchema new SimpleSchema(

    date:
        type: Date
        label: 'Date'
        optional: true
        autoform:
            type: 'bootstrap-datepicker'
            class: 'date'
            datePickerOptions:
                autoclose: 'true'

    person1:
        type: String
        label: 'Person 1'
        optional: true

    person2:
        type: String
        label: 'Person 2'
        optional: true

    person3:
        type: String
        label: 'Person 3'
        optional: true

    person4:
        type: String
        label: 'Person 4'
        optional: true
    )
