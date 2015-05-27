Template.imageView.helpers({
    images: function() {
        var pics = Pictures.find(); // Where Images is an FS.Collection instance

        var pics2 = pics.fetch();
        var obj = _.pluck(pics2, '_id');

        var url = _.map(obj, function(value, key) {
            return {
                image: 'cfs/files/images/' + value
            };
        });

        console.log(url);
        console.log(pics2);
        return pics;
    }
});