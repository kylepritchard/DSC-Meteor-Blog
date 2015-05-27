Meteor.methods(
    links: ->

        sailingcursor = Sailing.find {},
                    fields:
                        'title': 1

        trainingcursor = Training.find {},
                            fields:
                                'title': 1

        sailing = 'sailing': sailingcursor.fetch()
        training = 'training': trainingcursor.fetch()
        links = []
        links.push(sailing, training)
        return links
)
