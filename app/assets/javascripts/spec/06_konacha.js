mocha.setup(Konacha.mochaOptions);

mocha.suite.beforeEach(function () {
  var e = document.getElementById('konacha');
  if (e) {
    e.parentNode.removeChild(e);
  }

  e = document.createElement("div");
  e.id = "konacha";
  document.body.appendChild(e);
});

var expect = chai.expect,
    should = chai.should(),
    assert = chai.assert;

