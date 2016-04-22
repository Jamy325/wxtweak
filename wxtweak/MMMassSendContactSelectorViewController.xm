#import <UIKit/UIKit.h>

%hook MMMassSendContactSelectorViewController
/*
- (void)setSetSelectedContacts:(NSMutableSet *)setSelectedContacts { %log; %orig; }
- (NSMutableSet *)setSelectedContacts { %log; NSMutableSet * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)willShow { %log; %orig; }
- (void)onTopBarFrameChanged { %log; %orig; }
- (void)onDone:(id)arg1 { %log; %orig; }
- (void)onDeSelectAll:(id)arg1 { %log; %orig; }
- (void)searchBarTextDidBeginEditing:(id)arg1 { %log; %orig; }
- (void)searchBar:(id)arg1 textDidChange:(id)arg2 { %log; %orig; }
- (void)doSearch:(id)arg1 { %log; %orig; }
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 { %log; %orig; }
- (id)sectionIndexTitlesForTableView:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)tableView:(id)arg1 viewForHeaderInSection:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)tableView:(id)arg1 titleForHeaderInSection:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (long long)numberOfSectionsInTableView:(id)arg1 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2 { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)makeCell:(id)arg1 tableCell:(id)arg2 section:(unsigned long long)arg3 row:(unsigned long long)arg4 { %log; %orig; }
- (void)searchDisplayController:(id)arg1 didHideSearchResultsTableView:(id)arg2 { %log; %orig; }
- (void)searchDisplayController:(id)arg1 didShowSearchResultsTableView:(id)arg2 { %log; %orig; }
- (void)initToolView { %log; %orig; }
- (void)initSearchBar { %log; %orig; }
- (void)initTableView { %log; %orig; }
- (id)getRightBarButton:(_Bool)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)initView { %log; %orig; }
- (void)initData { %log; %orig; }
- (id)parseContactKey:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)processContact:(id)arg1 { %log; %orig; }
- (void)showAlertTooMany { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
*/

- (void)onSelectAll:(id)sender
{
    %log;
    %orig;
}

%end
