#import "helpers/UIView-SnapAppDel.h"

static NSString *provisionPath = [[NSBundle mainBundle] pathForResource:@"embedded.mobileprovision" ofType:@""];
static NSString *dylib = [[NSBundle mainBundle] pathForResource:@"dylib.dylib" ofType:@""];
static NSMutableArray *groupMediaToMarkRead = [NSMutableArray new];
static NSString *kSuccessTitle = [[SCAppDelPrefs sharedInstance] localizedStringForKey:@"SETTINGS"];
static NSString *kSuccessTitle1 = [[SCAppDelPrefs sharedInstance] localizedStringForKey:@"SETTINGS"];
static NSMutableArray *storiesToMarkRead = [NSMutableArray new];

static BOOL isLongPressing = NO;
static BOOL isVideoRecording = NO;
static BOOL isFirstTapped = NO;

static UITapGestureRecognizer *feedTapRecognizer = nil;

void longPressOnCameraTimer(UIGestureRecognizer *sender, id target) {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    if (sender.state == 1) {
      isLongPressing = YES;
      [target performSelector:@selector(stopRecordingNow) withObject:nil afterDelay:0];
    }
    if (sender.state == 3) {
      [target performSelector:@selector(stopRecordingNow)];
    }
  }
  
}

%hook SCAppDeIegate
- (void)applicationDidBecomeActive:(id)arg1 {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if (![defaults boolForKey:@"notFirstRun"]) {
        
      SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
      [alert showSuccess:@"تحذير - Warning" subTitle:@"من الممكن يتعرض حسابك للحظر من قبل شركة سناب شات بسبب استخدامك التطبيق المعدل ولذلك لست مسؤول عند استخدام سناب عثمان \n Your account may be blocked by Snapchat because of your use of third-party applications and therefore I am not responsible for using SCOthman \n By - Othman Al-Omiry \n عثمان العميري \n @OthmanAl3miry" closeButtonTitle:@"أتفهم I understand" duration:0.0f];
      [defaults setBool:YES forKey:@"notFirstRun"];
  }
}
%end

%hook NSBundle
- (NSString *)pathForResource: (NSString *)resourceName ofType: (NSString *)resourceType {
    if ([resourceName isEqualToString:provisionPath]) {
        // checks only
    }
    if ([resourceName isEqualToString:dylib]) {
        // checks only
    }
    return %orig;
}
%end

%hook AMPEvent
- (NSMutableDictionary *)mutableProperties {
  NSMutableDictionary *origInfo = %orig();

  [origInfo setObject:@"sanmmd" forKey:@"user_id"];
  [origInfo setObject:@"2B4507D5-3354-43C1-8B2D-815F749569A" forKey:@"session_id"];
  [origInfo setObject:@"3E6DA459-D6AC-4884-87AB-EB80CD72A8F8" forKey:@"client_id"];


  return origInfo;
}
%end

%group FILTERS_HOOK
%hook SCAppDeIegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {

  [[SrsHelper sharedInstance] updateEnabledFiltersForSnapchatWithCompletion:nil];
  [[SrsHelper sharedInstance] updateAppDelFiltersForSnapchatWithCompletion:nil];

  return %orig();

}
%end
%hook PreviewViewController
- (void)previewFilterDataProviderDidUpdateGeoFilters:(id)arg1 {
  %orig();
}
%end
%hook SCPreviewDefaultFilterDataProvider
- (id)_activeGeofilters {
  if ([[SCAppDelPrefs sharedInstance] scCustomFiltersEnabled]) {
    NSArray *origFilters = %orig();
    NSArray *newFilters = [SrsHelper filtersByAddingEnabledFiltersToSnapchatFilters:origFilters];
    return newFilters;
  }
  return %orig();
}
- (void)_updateActiveGeofilters {
  %orig();
  NSMutableDictionary *activeGeofilters = [self valueForKey:@"_activeGeofilters"];
  NSMutableDictionary *newActiveGeofilters = [SrsHelper filtersByAddingEnabledFiltersToSnapchatDictionaryFilters:activeGeofilters];
  [self setValue:newActiveGeofilters forKey:@"_activeGeofilters"];

  NSMutableDictionary *newActiveGeofilters2 = [SrsAppDel filtersByAddingAppDelFiltersToSnapchatDictionaryFilters:newActiveGeofilters];
  [self setValue:newActiveGeofilters2 forKey:@"_activeGeofilters"];


}
- (void)updateGeoFilter:(id)arg1 {
  %orig();
}
%end
%end


%group RECORDINGS
%hook AVCameraViewController
- (void)longPressOnCameraTimer:(UILongPressGestureRecognizer *)arg1 {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    if (sender.state == 3 || !isVideoRecording || isFirstTapped) {

      if (sender.state == 3 || isVideoRecording || isFirstTapped) {

        if ([self respondsToSelector:@selector(endRecording)]) {
          [self endRecording];
        } else {
          [self endRecordingWithMethod:0];
        }
        %orig();
        longPressOnCameraTimer(arg1, self);

      } else {
        %orig();
        longPressOnCameraTimer(arg1, self);
      }
    } else {
      isFirstTapped = YES;
    }
  } else {
    %orig();
    longPressOnCameraTimer(arg1, self);
  }
}
%new
- (void)stopRecordingNow {
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(forceStopRecording) object:nil];
  if ([self respondsToSelector:@selector(endRecording)]) {
    [self endRecording];
  } else {
    [self endRecordingWithMethod:0];
  }
}
- (void)endRecordingWithMethod:(unsigned long long)arg1 {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
        isVideoRecording = NO;
        isFirstTapped = NO;
        %orig();
      }
  } else {
    if (!isLongPressing) {
      if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
        isVideoRecording = NO;
        isFirstTapped = NO;
        %orig();
      }
    }
  }
}
- (void)endRecording {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
        isVideoRecording = NO;
        isFirstTapped = NO;
        %orig();
      }
  } else {
    if (!isLongPressing) {
      if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
        isVideoRecording = NO;
        isFirstTapped = NO;
        %orig();
      }
    }
  }
}
- (void)startRecordingWithMethod:(unsigned long long)arg1 {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    isVideoRecording = YES;
  }
  %orig();
}
- (void)startRecording {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    isVideoRecording = YES;
  }
  %orig();
}
%end
%hook SCCameraTimer
- (double)maxRecordingLength {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    return 65.0;
  }
  return %orig();
}
%end

%hook SCManagedVideoCapturer
- (instancetype)initWithMaxDuration:(double)duration {
  if ([[SCAppDelPrefs sharedInstance] scTapToRecordVideo]) {
    return %orig(65.0);
  } else {
    return %orig();
  }
}
%end
%end

%group SNAPS_HOOK
%hook Manager

- (void)startTimer:(id)arg1 source:(long long)arg2 {
  if (![[SCAppDelPrefs sharedInstance] scEnableSnapControls]) {
    %orig();
  }
}
%end
%hook SCFeedViewController
%new
- (SCSnapPlayController *)s_snapPlayController {
  if ([self respondsToSelector:@selector(getSnapPlayControllerInCurrentVC)]) {
    return [self getSnapPlayControllerInCurrentVC];
  } else if ([self respondsToSelector:@selector(snapPlayController)]) {
    return [self snapPlayController];
  }
  return nil;
}
- (void)handleTap:(id)arg1 {
  %orig();
  SCSnapPlayController *playController = [self s_snapPlayController];
  UIView *mediaView = [playController mediaView];

  if ([[SCAppDelPrefs sharedInstance] scSnapSaveButton]) {
    [mediaView snapAppDelAddSaveButton];
    [[mediaView snapAppDelAddSaveButton] removeTarget:nil action:nil forControlEvents:-1];
    [[mediaView snapAppDelAddSaveButton] addTarget:self action:@selector(snapAppDelDidPressSave) forControlEvents:64];
  } else {
    [[mediaView snapAppDelSaveButton] removeFromSuperview];
  }

  if ([[SCAppDelPrefs sharedInstance] scSnapSaveButton]) {
    [mediaView snapAppDelAddMarkReadButtton];
    [[mediaView snapAppDelMarkReadButton] removeTarget:nil action:nil forControlEvents:-1];
    [[mediaView snapAppDelMarkReadButton] addTarget:self action:@selector(snapAppDelDidPressMarkAsRead) forControlEvents:64];

    if (!feedTapRecognizer) {
      feedTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(appDelTapGesture)];
    }

    if (![[[mediaView snapAppDelMarkReadButton] gestureRecognizers] containsObject:feedTapRecognizer]) {
      [[mediaView snapAppDelMarkReadButton] addGestureRecognizer:feedTapRecognizer];
    }

  } else {
    [[mediaView snapAppDelMarkReadButton] removeFromSuperview];
  }
}
%new
- (Snap *)appDelCurrentSnap {
  return [[self s_snapPlayController] visibleSnap];
}
%new
- (void)snapAppDelDidPressSave {

  if ([self appDelCurrentSnap]) {
    
  }
}
%end
%end









