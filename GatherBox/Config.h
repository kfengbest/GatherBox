//
//  Config.h
//  GatherBox
//
//  Created by Kaven Feng on 11/10/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#ifndef GatherBox_Config_h
#define GatherBox_Config_h

static NSString* s_BaseUrl = @"http://collect.im";
static NSString* s_getActiveTypeAPI = @"/api/activities/types.json";
static NSString* s_getActiveListAPI = @"/api/activities.json?type=current";
static NSString* s_getActiveDetailAPI = @"/api/activities/show.json?";

static NSString* s_postActiveAPI = @"/api/activities";
static NSString* s_postVoteAPI = @"/api/activities/vote";
static NSString* s_postTokenAPI = @"/api/tokens/ios";

#endif
