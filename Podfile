# Uncomment the next line to define a global platform for your project
platform :ios, '13.2'
workspace 'ModularArchitectureExample'
use_frameworks!


def main_pods
  pod 'Swinject'
  pod 'R.swift'
end


def testing_pods
  pod 'Quick'
  pod 'Nimble'
end

def network_pods
  pod 'Alamofire'
end


target 'ModularArchitectureExample' do
  project 'ModularArchitectureExample.project'
  main_pods
end


target 'Service' do
  project 'Service/Service.project'
  network_pods
end
