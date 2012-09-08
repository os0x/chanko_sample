require 'spec_helper'

describe 'javascripts' do
  Dir.glob(Rails.root.join('spec/javascripts/**/*[sS]pec.js*')) do |path|
    file = path.split('/spec/javascripts/').last
    it "run #{file}" do
      spec = File.read(path)
      if /\.coffee$/ === file
        spec = CoffeeScript.compile(spec)
      end
      spec << <<-EOS
;(function() {
  var r = mocha.run();
  r.globals(["CapybaraInvocation"]);
  return r.total;
}());
      EOS
      spec =~ %r|^\n*/\*\n([^*]+)\*/.*|
      command = $1
      eval(command)
      page.status_code.should == 200
      total = page.evaluate_script spec
      page.should have_css('#report li.test.pass', :count => total)
      page.should_not have_css('#report li.test.fail')
    end
  end
end
