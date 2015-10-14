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
//  GoogleProject.m
//  GooglePodsHelper
//

#import "GoogleProject.h"

@implementation GoogleProject

static NSString* const GoogleService = @"GoogleService";

- (id)initWithName:(NSString*)name path:(NSString*)path
{
  if (self = [self init]) {
    _projectName = name;
    NSString* podspecFileName = [name stringByAppendingString:@".podspec"];
    NSString* podspecPath = [path stringByAppendingPathComponent:podspecFileName];
    NSString* podspecParentPath = [[path stringByDeletingLastPathComponent] stringByAppendingPathComponent:podspecFileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:podspecPath]) {
      _podspecPath = podspecPath;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:podspecParentPath]) {
      _podspecPath = podspecParentPath;
    }
    _directoryPath = path;

    NSString* configPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-Info.plist", GoogleService]];

    _infofilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/Info.plist", _projectName]];

    _configDictionary = [NSDictionary dictionaryWithContentsOfFile:configPath];
    _infoDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:_infofilePath];
    _podfilePath = [path stringByAppendingPathComponent:@"Podfile"];
  }

  return self;
}

- (BOOL)hasPodfile
{
  return [[NSFileManager defaultManager] fileExistsAtPath:self.podfilePath];
}


@end
