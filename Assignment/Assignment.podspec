

Pod::Spec.new do |spec|

  spec.name         = "Assignment"
  spec.version      = "1.0.0"
  spec.summary      = "This is an assignment for Spoton."
  spec.description  = "Spoton Assignment with simple crypto screen"
  spec.homepage     = "https://github.com/YashashreeK/Assignment"
  spec.license      = "MIT"
  spec.author             = { "YashashreeK" => "yashashreevkarkare@gmail.com" }
  spec.platform     = :ios, "14.5"
  spec.source       = { :git => "https://github.com/YashashreeK/Assignment.git", :tag => spec.version.to_s }
  spec.source_files  = "Assignment/**/*.{swift}"
  spec.exclude_files = "Assignment/AssignmentTests/*","Assignment/AssignmentApp/*"
  spec.swift_version = "5.0"
  
end
