$ ->
  $(".table-row-link").on "click", (e) ->
    unless $(e.target).data("confirm")? || $(e.target).parent("a[data-confirm]").length > 0
      url = $(@).data('url')
      document.location.href = url