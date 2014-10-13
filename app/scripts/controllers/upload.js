'use strict';

angular.module('ledgerdaryApp')
  .controller('UploadCtrl', function ($scope, FileUploader) {
    var accountId = 'PLACEHOLDER';
    var serviceUrl = 'http://ledgerdary.dev:3000/service/';
    $scope.uploader = new FileUploader({
      url: serviceUrl + 'accounts/' + accountId + '/statements'
    });
  });
