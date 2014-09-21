'use strict';

angular.module('ledgerdaryApp')
  .controller('UploadCtrl', function ($scope, FileUploader) {
    $scope.uploader = new FileUploader({url: 'service/upload'});
  });
