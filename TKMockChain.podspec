Pod::Spec.new do |s|
  s.name             = "TKMockChain"
  s.version          = "0.0.1"
  s.summary          = "Execute blocks in chain for easy mocking timed stuff."
  s.description      = "Execute blocks in chain for easy mocking timed stuff.Ex: Make a pause for X sec between each block."
  s.homepage         = "https://github.com/xslim/TKMockChain"
  s.license          = 'MIT'
  s.author           = { "Taras Kalapun" => "t.kalapun@gmail.com" }
  s.source           = { :git => "https://github.com/xslim/TKMockChain.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = ['TKMockChain.h', 'TKMockChain.m']

end
