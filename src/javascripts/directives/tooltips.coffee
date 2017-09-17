angular.module('mediMeet').directive 'tooltips', ($document, $window) =>
  {
    restrict: 'A',
    link: (scope, element, attrs) ->
      $document.bind "scroll", () =>
        $document.ready () ->
          $('[data-toggle="tooltip"]').tooltip()
          $('[data-toggle="popover"]').popover()
  }