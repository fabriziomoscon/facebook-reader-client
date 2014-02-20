angular.module('app').directive 'youtubeembed', () ->

  return {
    restrict: 'E'
    replace: true
    templateUrl: "directive/youtubeembed.html"
    scope: {
      source: '@'
    }
    link: (scope) -> scope.sourcenotautoplay = scope.source.replace 'autoplay=1', 'autoplay=0'
  }
