#import "LibIDN.h"
#import <idn/nameprep.h>
#import <idn/ucs4.h>

@implementation LibIDN

static idn_nameprep_t handle = NULL;

+ (NSString *)prepNode:(NSString *)node
{
	if(node == nil) return nil;
	
    @synchronized([LibIDN class]) {
        if (!handle) idn_nameprep_create(NULL, &handle);
    }
    
	// Each allowable portion of a JID MUST NOT be more than 1023 bytes in length.
	// We make the buffer just big enough to hold a null-terminated ucs4 string of this length.
	unsigned long from[1024], to[1024];
    char utf8[1024];
	
    if(idn_ucs4_utf8toucs4([node UTF8String], from, 1024) != idn_success) return nil;
    if(idn_nameprep_map(handle, from, to, 1024) != idn_success) return nil;
    if(idn_ucs4_ucs4toutf8(to, utf8, 1024) != idn_success) return nil;
	
	return [NSString stringWithUTF8String:utf8];
}

+ (NSString *)prepDomain:(NSString *)domain
{
	if(domain == nil) return nil;
    
    @synchronized([LibIDN class]) {
        if (!handle) idn_nameprep_create(NULL, &handle);
    }
	
	// Each allowable portion of a JID MUST NOT be more than 1023 bytes in length.
	// We make the buffer just big enough to hold a null-terminated ucs4 string of this length.
	unsigned long from[1024], to[1024];
    char utf8[1024];
	
    if(idn_ucs4_utf8toucs4([domain UTF8String], from, 1024) != idn_success) return nil;
    if(idn_nameprep_map(handle, from, to, 1024) != idn_success) return nil;
    if(idn_ucs4_ucs4toutf8(to, utf8, 1024) != idn_success) return nil;
	
	return [NSString stringWithUTF8String:utf8];
}

+ (NSString *)prepResource:(NSString *)resource
{
	if(resource == nil) return nil;
    
    @synchronized([LibIDN class]) {
        if (!handle) idn_nameprep_create(NULL, &handle);
    }
	
	// Each allowable portion of a JID MUST NOT be more than 1023 bytes in length.
	// We make the buffer just big enough to hold a null-terminated ucs4 string of this length.
	unsigned long from[1024], to[1024];
    char utf8[1024];
	
    if(idn_ucs4_utf8toucs4([resource UTF8String], from, 1024) != idn_success) return nil;
    if(idn_nameprep_map(handle, from, to, 1024) != idn_success) return nil;
    if(idn_ucs4_ucs4toutf8(to, utf8, 1024) != idn_success) return nil;
	
	return [NSString stringWithUTF8String:utf8];
}

@end
