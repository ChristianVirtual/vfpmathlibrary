/*
 VFP math library for the iPhone / iPod touch
 
 Copyright (c) 2007-2008 Wolfgang Engel and Matthias Grundmann
 http://code.google.com/p/vfpmathlibrary/
 
 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising
 from the use of this software.
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely,
 subject to the following restrictions:
 
 1. The origin of this software must not be misrepresented; you must
 not claim that you wrote the original software. If you use this
 software in a product, an acknowledgment in the product documentation
 would be appreciated but is not required.
 
 2. Altered source versions must be plainly marked as such, and must
 not be misrepresented as being the original software.
 
 3. This notice may not be removed or altered from any source distribution.
 */

#import <Foundation/Foundation.h>

// Basic Class to group related UnitTests for execution on iPhone.

@interface TestSuite : NSObject {
  UITextView* output_;
  NSMutableArray* test_methods_;
}

// Public interface.
- (id)initWithTextView:(UITextView*) output;
- (void)runTests;

// Interface for subclasses.
- (void)registerTest:(SEL)method showDescription:(NSString*)desc;

@end
