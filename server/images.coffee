fs = Npm.require('fs')
os = Npm.require('os')
path = Npm.require('path')

@UploadController = RouteController.extend(onBeforeAction: (req, res, next) ->
    files = []
        # Store files in an array and then pass them to request.
    if req.method == 'POST'
        busboy = new Busboy(headers: req.headers)
        busboy.on 'file', (fieldname, file, filename) ->
            # console.log filename
            # var timestamp = moment().format('X');
            # var saveTo = path.join('../../../../../public/uploads/', timestamp + '_' + filename);
            # var saveTo = path.join('../../../../../public/uploads/', timestamp + '-' + filename);
            saveTo = path.join(os.tmpDir(), filename)
            fstream = fs.createWriteStream(saveTo)
            file.pipe fstream
            files.push saveTo
            # console.log files
            # return
        busboy.on 'finish', ->
            # Pass the file array together with the request
            req.files = files
            next()
            return
        # Pass request to busboy
        req.pipe busboy
    else
        @next()
        return
)



# Route for image uploads
Router.route '/upload_image',
    name: 'upload_image'
    controller: 'UploadController'
    action: ->

        # we assume only one image here
        image = @request.files[0]

        Pictures.insert image, (err, fileObj) ->
            if err
                console.log 'fuck me!'
            else
                # handle success depending what you need to do
                asd = {
                    image: '/cfs/files/images/' + fileObj._id
                }
                return
        @next()
        return
        # @response.writeHead 200, 'Content-Type': 'application/json'
        # @response.end JSON.stringify(asd)
    where: 'server'


# Create a JSON listing all the files available
Router.route '/image_manager.json',
    name: 'image_manager'
    action: ->
        pics = Pictures.find().fetch()
        # Where Images is an FS.Collection instance
        obj = _.pluck(pics, '_id')
        json = _.map(obj, (value, key) ->
          {
            title: value
            image: '/cfs/files/images/' + value
            thumb: '/cfs/files/images/' + value + '?store=thumbs'
          }
        )
        @response.writeHead 200, 'Content-Type': 'application/json'
        @response.end JSON.stringify(json)
        return
    where: 'server'
