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
//  GooglePodfileManager.m
//  GooglePodsHelper
//

#import "GooglePodfileManager.h"

@interface GooglePodfileManager ()

@end

@implementation GooglePodfileManager

static NSString* const IS_ADS_ENABLED = @"IS_ADS_ENABLED";
static NSString* const IS_ANALYTICS_ENABLED = @"IS_ANALYTICS_ENABLED";
static NSString* const IS_APPINVITE_ENABLED = @"IS_APPINVITE_ENABLED";
static NSString* const IS_GCM_ENABLED = @"IS_GCM_ENABLED";
static NSString* const IS_SIGNIN_ENABLED = @"IS_SIGNIN_ENABLED";
static NSString* const ADMOB = @"Google/AdMob";
static NSString* const ANALYTICS = @"Google/Analytics";
static NSString* const APPINVITE = @"Google/AppInvite";
static NSString* const GCM = @"Google/CloudMessaging";
static NSString* const SIGNIN = @"Google/SignIn";

- (id)initWithProject:(GoogleProject *)project {
  if (self = [self init]) {
    _project = project;
  }

  return self;
}

- (void)createPodfile {
  NSString *podFilePath = _project.podfilePath;

  if (![_project hasPodfile]) {
    NSLog(@"Project doesn't have a podfile.");
    NSLog(@"Podfile Path: %@", podFilePath);

    [[NSFileManager defaultManager] createFileAtPath:podFilePath contents:nil attributes:nil];
    NSFileHandle *podfileHandle = [NSFileHandle fileHandleForWritingAtPath:podFilePath];
    [podfileHandle seekToEndOfFile];
    [podfileHandle writeData:[@"source 'https://github.com/CocoaPods/Specs.git'\n\n"
                                 dataUsingEncoding:NSUTF8StringEncoding]];
    [podfileHandle writeData:[@"platform :ios, '8.0'\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [podfileHandle closeFile];
  }

  [[[NSApplication sharedApplication] delegate] application:[NSApplication sharedApplication]
                                                   openFile:podFilePath];
}

- (void)addSelectedDependencies {
  NSDictionary *configDictionary = _project.configDictionary;

  if ([configDictionary valueForKey:IS_ADS_ENABLED]) {
    [self addDependency:ADMOB version:nil];
  }

  if ([configDictionary valueForKey:IS_ANALYTICS_ENABLED]) {
    [self addDependency:ANALYTICS version:nil];
  }

  if ([configDictionary valueForKey:IS_APPINVITE_ENABLED]) {
    [self addDependency:APPINVITE version:nil];
  }

  if ([configDictionary valueForKey:IS_GCM_ENABLED]) {
    [self addDependency:GCM version:nil];
  }

  if ([configDictionary valueForKey:IS_SIGNIN_ENABLED]) {
    [self addDependency:SIGNIN version:nil];
  }
}

- (void)addDependency:(NSString *)dependency version:(NSString *)version {
  if (![self hasDependency:dependency]) {
    NSString *podFilePath = _project.podfilePath;

    NSString *podDependencyDeclaration = [NSString stringWithFormat:@"\npod '%@'", dependency];
    if (version) {
      [podDependencyDeclaration
          stringByAppendingString:[NSString stringWithFormat:@"'%@'", version]];
    }

    NSFileHandle *podfileHandle = [NSFileHandle fileHandleForWritingAtPath:podFilePath];
    [podfileHandle seekToEndOfFile];
    [podfileHandle writeData:[podDependencyDeclaration dataUsingEncoding:NSUTF8StringEncoding]];
    [podfileHandle closeFile];
  }
}

- (BOOL)hasDependency:(NSString *)dependency {
  NSString *podFilePath = _project.podfilePath;

  NSError *readError;
  NSString *podfileContents = [NSString stringWithContentsOfFile:podFilePath
                                                        encoding:NSUTF8StringEncoding
                                                           error:&readError];
  if (readError) {
    NSLog(@"%@", readError);
  } else {
    NSRange dependencyLocation = [podfileContents rangeOfString:dependency];
    if (dependencyLocation.location != NSNotFound) {
      return YES;
    }
  }

  return NO;
}

@end
