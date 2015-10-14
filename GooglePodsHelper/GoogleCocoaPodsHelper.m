//
// Copyright (c) 2015 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  GoogleCocoaPodsHelper.m
//  GooglePodsHelper
//

#import "GoogleCocoaPodsHelper.h"

static NSString *const kGemExecutable = @"/usr/bin/gem";
static NSString *const kGemInstallCommand = @"install";
static NSString *const kGemUserInstallArgument = @"--user-install";
static NSString *const kGemCocoaPodsName = @"cocoapods";

NSString *GoogleCocoaPodsHelperRubyGemExecutable() { return kGemExecutable; }

NSArray *GoogleCocoaPodsHelperInstallArguments() {
  return @[ kGemInstallCommand, kGemUserInstallArgument, kGemCocoaPodsName ];
};

NSURL *GoogleCocoaPodsHelperGettingStartedURL() {
  return [NSURL URLWithString:@"http://guides.cocoapods.org/using/getting-started.html"];
}
