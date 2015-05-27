# @Images = new Mongo.Collection('images')
createThumb = (fileObj, readStream, writeStream) ->
    gm(readStream, fileObj.name()).resize('200', '200').stream().pipe(writeStream)

createMed = (fileObj, readStream, writeStream) ->
    gm(readStream, fileObj.name()).resize('1000', '1000').stream().pipe(writeStream)

imageStore = [
    new FS.Store.GridFS('images', { transformWrite: createMed } )
    new FS.Store.GridFS('thumbs', { transformWrite: createThumb } )
]

@Pictures = new FS.Collection('images', stores: imageStore)
