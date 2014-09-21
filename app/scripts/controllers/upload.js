'use strict';

angular.module('ledgerdaryApp')
  .controller('UploadCtrl', function ($scope, FileUploader) {
    $scope.uploader = new FileUploader({
      url: 'http://localhost:9393/service/account/record'
    });
  });
