sitemaps.add('/sitemap.xml', function() {
    return [{
        page: '/',
        changefreq: 'weekly'
    }, {
        page: '/about',
        changefreq: 'weekly'
    }, {
        page: '/about/more',
        changefreq: 'weekly'
    }];
});