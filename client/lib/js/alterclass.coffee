###*
# jQuery alterClass plugin
#
# Remove element classes with wildcard matching. Optionally add classes:
#   $( '#foo' ).alterClass( 'foo-* bar-*', 'foobar' )
#
# Copyright (c) 2011 Pete Boere (the-echoplex.net)
# Free under terms of the MIT license: http://www.opensource.org/licenses/mit-license.php
#
###

(($) ->

  $.fn.alterClass = (removals, additions) ->
    self = this
    if removals.indexOf('*') == -1
      # Use native jQuery methods if there is no wildcard matching
      self.removeClass removals
      return if !additions then self else self.addClass(additions)
    patt = new RegExp('\\s' + removals.replace(/\*/g, '[A-Za-z0-9-_]+').split(' ').join('\\s|\\s') + '\\s', 'g')
    self.each (i, it) ->
      cn = ' ' + it.className + ' '
      while patt.test(cn)
        cn = cn.replace(patt, ' ')
      it.className = $.trim(cn)
      return
    if !additions then self else self.addClass(additions)

  return
) jQuery
