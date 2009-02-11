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

#import "MatrixTest.h"
#import "../../matrix_impl.h"

@implementation MatrixTest

- (id)initWithTextView:(UITextView*)output {
  if (self = [super initWithTextView:output]) {
    [self registerTest:@selector(testMatrix4Mul) showDescription:@"Matrix4Mul"];
    [self registerTest:@selector(testMatrix4Vector4Mul) showDescription:@"Matrix4Vector4Mul"];

    [self registerTest:@selector(testMatrix4Vector3MulUnit) 
       showDescription:@"Matrix4Vector3Mul"];

    [self registerTest:@selector(testMatrix4Vector3Mul) 
       showDescription:@"Matrix4Vector3Mul Unit"];
    
    // Setup test matrices.
    float matrix_a_data[16] = { -45,    38,   -13,   -63,
                                -91,   -37,   -24,    -3,
                                -81,    90,    53,   -11,
                                 64,   -94,    59,    29 };
    memcpy(matrix_a_, matrix_a_data, 16 * sizeof(float));
    
    float matrix_b_data[16] = { -30,    83,   -24,    6,
                                 66,   -43,    13,    55,
                                 17,    51,   -85,    86,
                                  9,    50,   -90,   -75};
    
    memcpy(matrix_b_, matrix_b_data, 16 * sizeof(float));
    
    float vec4_data[4] = { 31, -68, -77, -1 };
    memcpy(vec4_, vec4_data, 4 * sizeof(float) );
    
    float vec3_data[3] = { -49,  1, 39 };
    memcpy(vec3_, vec3_data, 3 * sizeof(float) );

  }
  
  return self;
}

- (void) dealloc {
  [super dealloc]; 
}

- (BOOL) testMatrix4Mul {
  Matrix4Mul(matrix_a_, matrix_b_, result_);
  
  float result_data[16] = {   3070,  -9182,   8349,   5427,
                              -147,  -7336,   4013,  -4420,
                              9172,  -8440,   -401,   9847,
                             -6860,  13813, -10383,  -1887 };
  
  return memcmp(result_, result_data, 16 * sizeof(float)) == 0;
}

- (BOOL) testMatrix4Vector4Mul {
  Matrix4Vector4Mul(matrix_a_, vec4_, result_);
  float result_data[4] = { -2915, 1546, -12701, 3804 };
  
  return memcmp(result_, result_data, 4 * sizeof(float)) == 0;
}

- (BOOL) testMatrix4Vector3Mul {
  Matrix4Vector3Mul(matrix_a_, vec3_, 13.0, result_);
  float result_data[4] = { 917, 3447, 5983, -552 };
  return memcmp(result_, result_data, 4 * sizeof(float)) == 0;
}

- (BOOL) testMatrix4Vector3MulUnit {
  Matrix4Vector3Mul(matrix_a_, vec3_, result_);
  float result_data[4] = { 1673, 3483, 6115, -900 };
  
  return memcmp(result_, result_data, 4 * sizeof(float)) == 0;
  
}

@end
