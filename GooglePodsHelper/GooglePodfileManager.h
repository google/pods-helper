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
//  GooglePodfileManager.h
//  GooglePodsHelper
//

@import AppKit;
#import "GoogleProject.h"

/**
 * Manages the Podfile associated with an Xcode project.
 */
@interface GooglePodfileManager : NSObject

/**
 * Creates an empty Podfile for the Xcode project if one does not already exist.
 */
- (void)createPodfile;


/**
 * Adds the previously chosen dependencies to the Podfile.
 */
- (void)addSelectedDependencies;

- (id)initWithProject:(GoogleProject *)project;

@property (nonatomic, copy, readonly) GoogleProject* project;

@end
