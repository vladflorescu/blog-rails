$(document).ready(()-> {
  # articleTextarea = $('.article-text-area');

  # articleTextarea.on('keydown.ignoreTabs', (evt)-> {
  #   if (evt.keyCode == 9) { # tab was pressed
  #     # get caret position/selection
  #     start = this.selectionStart;
  #     end = this.selectionEnd;

  #     $this = $(this);
  #     value = $this.val();

  #     # set textarea value to: text before caret + tab + text after caret
  #     $this.val(value.substring(0, start)
  #                 + '\t'
  #                 + value.substring(end));

  #     # put caret at right position again (add one for the tab)
  #     this.selectionStart = this.selectionEnd = start + 1;

  #     # prevent the focus lose
  #     evt.preventDefault();
  #   }
  # });

  # resizeTextarea = ()-> {
  #   articleTextarea.get(0).style.height = 'auto';
  #   articleTextarea.get(0).style.height = articleTextarea.get(0).scrollHeight + 'px';
  # }

  # articleTextarea.on('keydown.resizeTextarea', resizeTextarea);
  # articleTextarea.on('change', resizeTextarea);

  # articleTextarea.bind({
  #   paste: resizeTextarea,
  #   cut: resizeTextarea,
  #   drop: resizeTextarea
  # });

  # $(window).on('resize.resizeTextarea', resizeTextarea);
});