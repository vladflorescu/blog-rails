$(document).ready(()->
  articleTextarea = $('#article-text-area');

  if articleTextarea.length > 0
    articleTextarea.on('keydown.ignoreTabs', (evt)->
      if (evt.keyCode == 9)
        # prevent the focus lose
        evt.preventDefault();

        domTextarea = articleTextarea.get(0);

        # get caret position/selection
        start = domTextarea.selectionStart;
        end = domTextarea.selectionEnd;

        value = articleTextarea.val();

        # set textarea value to: text before caret + tab + text after caret
        articleTextarea.val(value.substring(0, start) + '\t' + value.substring(end));

        # put caret at right position again (add one for the tab)
        domTextarea.selectionStart = domTextarea.selectionEnd = start + 1;
    );

    resizeTextarea = ()->
      articleTextarea.get(0).style.height = 'auto';
      articleTextarea.get(0).style.height = articleTextarea.get(0).scrollHeight + 'px';

    articleTextarea.on('keydown.resizeTextarea', resizeTextarea);
    articleTextarea.on('change', resizeTextarea);

    articleTextarea.bind({
      paste: resizeTextarea,
      cut: resizeTextarea,
      drop: resizeTextarea
    });

    $(window).on('resize.resizeTextarea', resizeTextarea);

    # For when you're entering on the edit page
    resizeTextarea();
);
