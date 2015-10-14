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
//  GoogleProject.h
//  GooglePodsHelper
//

#import <Foundation/Foundation.h>

@interface GoogleProject : NSObject

@property (nonatomic, copy, readonly) NSString* configPath;
@property (nonatomic, copy, readonly) NSString* directoryPath;
@property (nonatomic, copy, readonly) NSString* infofilePath;
@property (nonatomic, copy, readonly) NSString* podspecPath;
@property (nonatomic, copy, readonly) NSString* podfilePath;
@property (nonatomic, copy, readonly) NSString* projectName;
@property (nonatomic, copy, readonly) NSDictionary* configDictionary;
@property (nonatomic, copy, readonly) NSMutableDictionary* infoDictionary;

- (id)initWithName:(NSString*)name path:(NSString*)path;

- (BOOL)hasPodfile;

@end
