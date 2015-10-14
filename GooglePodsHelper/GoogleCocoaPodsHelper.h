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
//  GoogleCocoaPodsHelper.h
//  GooglePodsHelper
//

@import Foundation;

/**
 * Gets the path of Ruby's gem binary.
 * @return  the path of the gem executable
 */
NSString *GoogleCocoaPodsHelperRubyGemExecutable();

/**
 * Gets the list of arguments that should be passed to the gem
 * executable in order to install CocoaPods.
 * @return the array of gem arguments for installing CocoaPods
 */
NSArray *GoogleCocoaPodsHelperInstallArguments();

/**
 * Gets the URL of the CocoaPods getting started page, to instruct
 * users on how to manually install CocoaPods.
 * @return  the CocoaPods getting started URL
 */
NSURL *GoogleCocoaPodsHelperGettingStartedURL();
