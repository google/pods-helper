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
//  GoogleInfofileManager.h
//  GooglePodsHelper
//

@import AppKit;
#import "GoogleProject.h"

/**
 * Manages the Infofile associated with an Xcode project.
 */
@interface GoogleInfofileManager : NSObject

/**
 * Adds a dependency (SDK) to the Podfile.
 * @param dependency  the name of the CocoaPod SDK to install
 * @param version the string describing the required version, eg. "~> 3.0", can be nil
 */
- (void)addURLScheme;

- (id)initWithProject:(GoogleProject *)project;

@property (nonatomic, copy, readonly) GoogleProject* project;

@end
