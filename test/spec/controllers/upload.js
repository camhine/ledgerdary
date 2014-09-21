'use strict';

describe('Controller: UploadCtrl', function () {

  // load the controller's module
  beforeEach(module('ledgerdaryApp'));

  var UploadCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UploadCtrl = $controller('UploadCtrl', {
      $scope: scope
    });
  }));

  iit('should upload files to the service', function () {

  });
});
