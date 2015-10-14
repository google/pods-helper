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
//  GoogleInfofileManager.m
//  GooglePodsHelper
//

#import "GoogleInfofileManager.h"

@interface GoogleInfofileManager ()

@end

@implementation GoogleInfofileManager

static NSString* const URL_TYPES = @"URL types";
static NSString* const URL_SCHEMES = @"URL Schemes";
static NSString* const REVERSED_CLIENT_ID = @"REVERSED_CLIENT_ID";
static NSString* const BUNDLE_IDENTIFIER = @"CFBundleIdentifier";

- (id)initWithProject:(GoogleProject *)project
{
  if (self = [self init]) {
    _project = project;
  }

  return self;
}

- (void)addURLScheme {
  NSMutableDictionary *infoDictionary = _project.infoDictionary;
  NSDictionary *configDictionary = _project.configDictionary;
  NSString *scheme = [configDictionary objectForKey:REVERSED_CLIENT_ID];
  NSString *bundleId = [infoDictionary objectForKey:BUNDLE_IDENTIFIER];
  NSMutableArray *urlTypes = [infoDictionary objectForKey:URL_TYPES];

  NSDictionary *urlTypeScheme = [NSDictionary dictionaryWithObjectsAndKeys: @"Editor", @"Document Role", @"google", @"URL identifier", [NSArray arrayWithObject:scheme], URL_SCHEMES, nil];
  NSDictionary *urlTypeBundleId = [NSDictionary dictionaryWithObjectsAndKeys: @"Editor", @"Document Role", @"google", @"URL identifier", [NSArray arrayWithObject:bundleId], URL_SCHEMES, nil];

  if (!urlTypes){
    urlTypes = [NSArray arrayWithObjects:urlTypeScheme, urlTypeBundleId, nil];
    [infoDictionary setValue:urlTypes forKey:URL_TYPES];
  } else {
    if (![self hasURLScheme:scheme URLTypes:urlTypes]) {
      [urlTypes addObject:urlTypeScheme];
    }
    if (![self hasURLScheme:bundleId URLTypes:urlTypes]) {
      [urlTypes addObject:urlTypeBundleId];
    }
  }
  [infoDictionary writeToFile:_project.infofilePath atomically:YES];
}

- (BOOL)hasURLScheme:(NSString *)scheme URLTypes:(NSArray *)URLTypes {
  for (NSDictionary *type in URLTypes) {
    if ([type objectForKey:URL_SCHEMES] && [[[type objectForKey:URL_SCHEMES] objectAtIndex:0] isEqualToString:scheme])
      return YES;
  }
  return NO;
}

@end
