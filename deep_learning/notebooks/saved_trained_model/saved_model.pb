л
єФ
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 

BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

$
DisableCopyOnRead
resource
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	

MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 ":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
С
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring Ј
@
StaticRegexFullMatch	
input

output
"
patternstring
L

StringJoin
inputs*N

output"

Nint("
	separatorstring 
А
VarHandleOp
resource"
	containerstring "
shared_namestring "

debug_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.15.02v2.15.0-rc1-8-g6887368d6d48љЭ
v
countVarHandleOp*
_output_shapes
: *

debug_namecount/*
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
v
totalVarHandleOp*
_output_shapes
: *

debug_nametotal/*
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
|
count_1VarHandleOp*
_output_shapes
: *

debug_name
count_1/*
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
|
total_1VarHandleOp*
_output_shapes
: *

debug_name
total_1/*
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
Ї
Adam/v/dense_14/biasVarHandleOp*
_output_shapes
: *%

debug_nameAdam/v/dense_14/bias/*
dtype0*
shape:
*%
shared_nameAdam/v/dense_14/bias
y
(Adam/v/dense_14/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_14/bias*
_output_shapes
:
*
dtype0
Ї
Adam/m/dense_14/biasVarHandleOp*
_output_shapes
: *%

debug_nameAdam/m/dense_14/bias/*
dtype0*
shape:
*%
shared_nameAdam/m/dense_14/bias
y
(Adam/m/dense_14/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_14/bias*
_output_shapes
:
*
dtype0
Г
Adam/v/dense_14/kernelVarHandleOp*
_output_shapes
: *'

debug_nameAdam/v/dense_14/kernel/*
dtype0*
shape:
шу
*'
shared_nameAdam/v/dense_14/kernel

*Adam/v/dense_14/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_14/kernel* 
_output_shapes
:
шу
*
dtype0
Г
Adam/m/dense_14/kernelVarHandleOp*
_output_shapes
: *'

debug_nameAdam/m/dense_14/kernel/*
dtype0*
shape:
шу
*'
shared_nameAdam/m/dense_14/kernel

*Adam/m/dense_14/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_14/kernel* 
_output_shapes
:
шу
*
dtype0
Њ
Adam/v/conv2d_25/biasVarHandleOp*
_output_shapes
: *&

debug_nameAdam/v/conv2d_25/bias/*
dtype0*
shape:
*&
shared_nameAdam/v/conv2d_25/bias
{
)Adam/v/conv2d_25/bias/Read/ReadVariableOpReadVariableOpAdam/v/conv2d_25/bias*
_output_shapes
:
*
dtype0
Њ
Adam/m/conv2d_25/biasVarHandleOp*
_output_shapes
: *&

debug_nameAdam/m/conv2d_25/bias/*
dtype0*
shape:
*&
shared_nameAdam/m/conv2d_25/bias
{
)Adam/m/conv2d_25/bias/Read/ReadVariableOpReadVariableOpAdam/m/conv2d_25/bias*
_output_shapes
:
*
dtype0
М
Adam/v/conv2d_25/kernelVarHandleOp*
_output_shapes
: *(

debug_nameAdam/v/conv2d_25/kernel/*
dtype0*
shape:

*(
shared_nameAdam/v/conv2d_25/kernel

+Adam/v/conv2d_25/kernel/Read/ReadVariableOpReadVariableOpAdam/v/conv2d_25/kernel*&
_output_shapes
:

*
dtype0
М
Adam/m/conv2d_25/kernelVarHandleOp*
_output_shapes
: *(

debug_nameAdam/m/conv2d_25/kernel/*
dtype0*
shape:

*(
shared_nameAdam/m/conv2d_25/kernel

+Adam/m/conv2d_25/kernel/Read/ReadVariableOpReadVariableOpAdam/m/conv2d_25/kernel*&
_output_shapes
:

*
dtype0
Њ
Adam/v/conv2d_24/biasVarHandleOp*
_output_shapes
: *&

debug_nameAdam/v/conv2d_24/bias/*
dtype0*
shape:
*&
shared_nameAdam/v/conv2d_24/bias
{
)Adam/v/conv2d_24/bias/Read/ReadVariableOpReadVariableOpAdam/v/conv2d_24/bias*
_output_shapes
:
*
dtype0
Њ
Adam/m/conv2d_24/biasVarHandleOp*
_output_shapes
: *&

debug_nameAdam/m/conv2d_24/bias/*
dtype0*
shape:
*&
shared_nameAdam/m/conv2d_24/bias
{
)Adam/m/conv2d_24/bias/Read/ReadVariableOpReadVariableOpAdam/m/conv2d_24/bias*
_output_shapes
:
*
dtype0
М
Adam/v/conv2d_24/kernelVarHandleOp*
_output_shapes
: *(

debug_nameAdam/v/conv2d_24/kernel/*
dtype0*
shape:
*(
shared_nameAdam/v/conv2d_24/kernel

+Adam/v/conv2d_24/kernel/Read/ReadVariableOpReadVariableOpAdam/v/conv2d_24/kernel*&
_output_shapes
:
*
dtype0
М
Adam/m/conv2d_24/kernelVarHandleOp*
_output_shapes
: *(

debug_nameAdam/m/conv2d_24/kernel/*
dtype0*
shape:
*(
shared_nameAdam/m/conv2d_24/kernel

+Adam/m/conv2d_24/kernel/Read/ReadVariableOpReadVariableOpAdam/m/conv2d_24/kernel*&
_output_shapes
:
*
dtype0

learning_rateVarHandleOp*
_output_shapes
: *

debug_namelearning_rate/*
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0

	iterationVarHandleOp*
_output_shapes
: *

debug_name
iteration/*
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	

dense_14/biasVarHandleOp*
_output_shapes
: *

debug_namedense_14/bias/*
dtype0*
shape:
*
shared_namedense_14/bias
k
!dense_14/bias/Read/ReadVariableOpReadVariableOpdense_14/bias*
_output_shapes
:
*
dtype0

dense_14/kernelVarHandleOp*
_output_shapes
: * 

debug_namedense_14/kernel/*
dtype0*
shape:
шу
* 
shared_namedense_14/kernel
u
#dense_14/kernel/Read/ReadVariableOpReadVariableOpdense_14/kernel* 
_output_shapes
:
шу
*
dtype0

conv2d_25/biasVarHandleOp*
_output_shapes
: *

debug_nameconv2d_25/bias/*
dtype0*
shape:
*
shared_nameconv2d_25/bias
m
"conv2d_25/bias/Read/ReadVariableOpReadVariableOpconv2d_25/bias*
_output_shapes
:
*
dtype0
Ї
conv2d_25/kernelVarHandleOp*
_output_shapes
: *!

debug_nameconv2d_25/kernel/*
dtype0*
shape:

*!
shared_nameconv2d_25/kernel
}
$conv2d_25/kernel/Read/ReadVariableOpReadVariableOpconv2d_25/kernel*&
_output_shapes
:

*
dtype0

conv2d_24/biasVarHandleOp*
_output_shapes
: *

debug_nameconv2d_24/bias/*
dtype0*
shape:
*
shared_nameconv2d_24/bias
m
"conv2d_24/bias/Read/ReadVariableOpReadVariableOpconv2d_24/bias*
_output_shapes
:
*
dtype0
Ї
conv2d_24/kernelVarHandleOp*
_output_shapes
: *!

debug_nameconv2d_24/kernel/*
dtype0*
shape:
*!
shared_nameconv2d_24/kernel
}
$conv2d_24/kernel/Read/ReadVariableOpReadVariableOpconv2d_24/kernel*&
_output_shapes
:
*
dtype0

serving_default_conv2d_24_inputPlaceholder*1
_output_shapes
:џџџџџџџџџрр*
dtype0*&
shape:џџџџџџџџџрр
Ќ
StatefulPartitionedCallStatefulPartitionedCallserving_default_conv2d_24_inputconv2d_24/kernelconv2d_24/biasconv2d_25/kernelconv2d_25/biasdense_14/kerneldense_14/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *,
f'R%
#__inference_signature_wrapper_47104

NoOpNoOp
Х8
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*8
valueі7Bѓ7 Bь7
ш
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer-4
layer_with_weights-2
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
Ш
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias
 _jit_compiled_convolution_op*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
Ш
	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses

%kernel
&bias
 '_jit_compiled_convolution_op*

(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses* 

.	variables
/trainable_variables
0regularization_losses
1	keras_api
2__call__
*3&call_and_return_all_conditional_losses* 
І
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses

:kernel
;bias*
.
0
1
%2
&3
:4
;5*
.
0
1
%2
&3
:4
;5*
* 
А
<non_trainable_variables

=layers
>metrics
?layer_regularization_losses
@layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Atrace_0
Btrace_1* 

Ctrace_0
Dtrace_1* 
* 

E
_variables
F_iterations
G_learning_rate
H_index_dict
I
_momentums
J_velocities
K_update_step_xla*

Lserving_default* 

0
1*

0
1*
* 

Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Rtrace_0* 

Strace_0* 
`Z
VARIABLE_VALUEconv2d_24/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEconv2d_24/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

Ytrace_0* 

Ztrace_0* 

%0
&1*

%0
&1*
* 

[non_trainable_variables

\layers
]metrics
^layer_regularization_losses
_layer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses*

`trace_0* 

atrace_0* 
`Z
VARIABLE_VALUEconv2d_25/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEconv2d_25/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses* 

gtrace_0* 

htrace_0* 
* 
* 
* 

inon_trainable_variables

jlayers
kmetrics
llayer_regularization_losses
mlayer_metrics
.	variables
/trainable_variables
0regularization_losses
2__call__
*3&call_and_return_all_conditional_losses
&3"call_and_return_conditional_losses* 

ntrace_0* 

otrace_0* 

:0
;1*

:0
;1*
* 

pnon_trainable_variables

qlayers
rmetrics
slayer_regularization_losses
tlayer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses*

utrace_0* 

vtrace_0* 
_Y
VARIABLE_VALUEdense_14/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEdense_14/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
.
0
1
2
3
4
5*

w0
x1*
* 
* 
* 
* 
* 
* 
g
F0
y1
z2
{3
|4
}5
~6
7
8
9
10
11
12*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
0
y0
{1
}2
3
4
5*
1
z0
|1
~2
3
4
5*
V
trace_0
trace_1
trace_2
trace_3
trace_4
trace_5* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
	variables
	keras_api

total

count*
M
	variables
	keras_api

total

count

_fn_kwargs*
b\
VARIABLE_VALUEAdam/m/conv2d_24/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEAdam/v/conv2d_24/kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/conv2d_24/bias1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/v/conv2d_24/bias1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEAdam/m/conv2d_25/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEAdam/v/conv2d_25/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/conv2d_25/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/v/conv2d_25/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/m/dense_14/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEAdam/v/dense_14/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/m/dense_14/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEAdam/v/dense_14/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 

0
1*

	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

0
1*

	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
я
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameconv2d_24/kernelconv2d_24/biasconv2d_25/kernelconv2d_25/biasdense_14/kerneldense_14/bias	iterationlearning_rateAdam/m/conv2d_24/kernelAdam/v/conv2d_24/kernelAdam/m/conv2d_24/biasAdam/v/conv2d_24/biasAdam/m/conv2d_25/kernelAdam/v/conv2d_25/kernelAdam/m/conv2d_25/biasAdam/v/conv2d_25/biasAdam/m/dense_14/kernelAdam/v/dense_14/kernelAdam/m/dense_14/biasAdam/v/dense_14/biastotal_1count_1totalcountConst*%
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *'
f"R 
__inference__traced_save_47391
ъ
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv2d_24/kernelconv2d_24/biasconv2d_25/kernelconv2d_25/biasdense_14/kerneldense_14/bias	iterationlearning_rateAdam/m/conv2d_24/kernelAdam/v/conv2d_24/kernelAdam/m/conv2d_24/biasAdam/v/conv2d_24/biasAdam/m/conv2d_25/kernelAdam/v/conv2d_25/kernelAdam/m/conv2d_25/biasAdam/v/conv2d_25/biasAdam/m/dense_14/kernelAdam/v/dense_14/kernelAdam/m/dense_14/biasAdam/v/dense_14/biastotal_1count_1totalcount*$
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 **
f%R#
!__inference__traced_restore_47472аЯ

g
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_46930

inputs
identityЂ
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ћ
J
"__inference__update_step_xla_47124
gradient
variable:
*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:
: *
	_noinline(:D @

_output_shapes
:

"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ъ


#__inference_signature_wrapper_47104
conv2d_24_input!
unknown:

	unknown_0:
#
	unknown_1:


	unknown_2:

	unknown_3:
шу

	unknown_4:

identityЂStatefulPartitionedCallѕ
StatefulPartitionedCallStatefulPartitionedCallconv2d_24_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *)
f$R"
 __inference__wrapped_model_46915o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:%!

_user_specified_name47090:%!

_user_specified_name47092:%!

_user_specified_name47094:%!

_user_specified_name47096:%!

_user_specified_name47098:%!

_user_specified_name47100

g
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_47194

inputs
identityЂ
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Н
ќ
__inference__traced_save_47391
file_prefixA
'read_disablecopyonread_conv2d_24_kernel:
5
'read_1_disablecopyonread_conv2d_24_bias:
C
)read_2_disablecopyonread_conv2d_25_kernel:

5
'read_3_disablecopyonread_conv2d_25_bias:
<
(read_4_disablecopyonread_dense_14_kernel:
шу
4
&read_5_disablecopyonread_dense_14_bias:
,
"read_6_disablecopyonread_iteration:	 0
&read_7_disablecopyonread_learning_rate: J
0read_8_disablecopyonread_adam_m_conv2d_24_kernel:
J
0read_9_disablecopyonread_adam_v_conv2d_24_kernel:
=
/read_10_disablecopyonread_adam_m_conv2d_24_bias:
=
/read_11_disablecopyonread_adam_v_conv2d_24_bias:
K
1read_12_disablecopyonread_adam_m_conv2d_25_kernel:

K
1read_13_disablecopyonread_adam_v_conv2d_25_kernel:

=
/read_14_disablecopyonread_adam_m_conv2d_25_bias:
=
/read_15_disablecopyonread_adam_v_conv2d_25_bias:
D
0read_16_disablecopyonread_adam_m_dense_14_kernel:
шу
D
0read_17_disablecopyonread_adam_v_dense_14_kernel:
шу
<
.read_18_disablecopyonread_adam_m_dense_14_bias:
<
.read_19_disablecopyonread_adam_v_dense_14_bias:
+
!read_20_disablecopyonread_total_1: +
!read_21_disablecopyonread_count_1: )
read_22_disablecopyonread_total: )
read_23_disablecopyonread_count: 
savev2_const
identity_49ЂMergeV2CheckpointsЂRead/DisableCopyOnReadЂRead/ReadVariableOpЂRead_1/DisableCopyOnReadЂRead_1/ReadVariableOpЂRead_10/DisableCopyOnReadЂRead_10/ReadVariableOpЂRead_11/DisableCopyOnReadЂRead_11/ReadVariableOpЂRead_12/DisableCopyOnReadЂRead_12/ReadVariableOpЂRead_13/DisableCopyOnReadЂRead_13/ReadVariableOpЂRead_14/DisableCopyOnReadЂRead_14/ReadVariableOpЂRead_15/DisableCopyOnReadЂRead_15/ReadVariableOpЂRead_16/DisableCopyOnReadЂRead_16/ReadVariableOpЂRead_17/DisableCopyOnReadЂRead_17/ReadVariableOpЂRead_18/DisableCopyOnReadЂRead_18/ReadVariableOpЂRead_19/DisableCopyOnReadЂRead_19/ReadVariableOpЂRead_2/DisableCopyOnReadЂRead_2/ReadVariableOpЂRead_20/DisableCopyOnReadЂRead_20/ReadVariableOpЂRead_21/DisableCopyOnReadЂRead_21/ReadVariableOpЂRead_22/DisableCopyOnReadЂRead_22/ReadVariableOpЂRead_23/DisableCopyOnReadЂRead_23/ReadVariableOpЂRead_3/DisableCopyOnReadЂRead_3/ReadVariableOpЂRead_4/DisableCopyOnReadЂRead_4/ReadVariableOpЂRead_5/DisableCopyOnReadЂRead_5/ReadVariableOpЂRead_6/DisableCopyOnReadЂRead_6/ReadVariableOpЂRead_7/DisableCopyOnReadЂRead_7/ReadVariableOpЂRead_8/DisableCopyOnReadЂRead_8/ReadVariableOpЂRead_9/DisableCopyOnReadЂRead_9/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: y
Read/DisableCopyOnReadDisableCopyOnRead'read_disablecopyonread_conv2d_24_kernel"/device:CPU:0*
_output_shapes
 Ћ
Read/ReadVariableOpReadVariableOp'read_disablecopyonread_conv2d_24_kernel^Read/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:
*
dtype0q
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:
i

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*&
_output_shapes
:
{
Read_1/DisableCopyOnReadDisableCopyOnRead'read_1_disablecopyonread_conv2d_24_bias"/device:CPU:0*
_output_shapes
 Ѓ
Read_1/ReadVariableOpReadVariableOp'read_1_disablecopyonread_conv2d_24_bias^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0i

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
_

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
:
}
Read_2/DisableCopyOnReadDisableCopyOnRead)read_2_disablecopyonread_conv2d_25_kernel"/device:CPU:0*
_output_shapes
 Б
Read_2/ReadVariableOpReadVariableOp)read_2_disablecopyonread_conv2d_25_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:

*
dtype0u

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:

k

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*&
_output_shapes
:

{
Read_3/DisableCopyOnReadDisableCopyOnRead'read_3_disablecopyonread_conv2d_25_bias"/device:CPU:0*
_output_shapes
 Ѓ
Read_3/ReadVariableOpReadVariableOp'read_3_disablecopyonread_conv2d_25_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:
|
Read_4/DisableCopyOnReadDisableCopyOnRead(read_4_disablecopyonread_dense_14_kernel"/device:CPU:0*
_output_shapes
 Њ
Read_4/ReadVariableOpReadVariableOp(read_4_disablecopyonread_dense_14_kernel^Read_4/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
шу
*
dtype0o

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
шу
e

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0* 
_output_shapes
:
шу
z
Read_5/DisableCopyOnReadDisableCopyOnRead&read_5_disablecopyonread_dense_14_bias"/device:CPU:0*
_output_shapes
 Ђ
Read_5/ReadVariableOpReadVariableOp&read_5_disablecopyonread_dense_14_bias^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:
v
Read_6/DisableCopyOnReadDisableCopyOnRead"read_6_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 
Read_6/ReadVariableOpReadVariableOp"read_6_disablecopyonread_iteration^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	f
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0	*
_output_shapes
: z
Read_7/DisableCopyOnReadDisableCopyOnRead&read_7_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 
Read_7/ReadVariableOpReadVariableOp&read_7_disablecopyonread_learning_rate^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0f
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes
: 
Read_8/DisableCopyOnReadDisableCopyOnRead0read_8_disablecopyonread_adam_m_conv2d_24_kernel"/device:CPU:0*
_output_shapes
 И
Read_8/ReadVariableOpReadVariableOp0read_8_disablecopyonread_adam_m_conv2d_24_kernel^Read_8/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:
*
dtype0v
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:
m
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*&
_output_shapes
:

Read_9/DisableCopyOnReadDisableCopyOnRead0read_9_disablecopyonread_adam_v_conv2d_24_kernel"/device:CPU:0*
_output_shapes
 И
Read_9/ReadVariableOpReadVariableOp0read_9_disablecopyonread_adam_v_conv2d_24_kernel^Read_9/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:
*
dtype0v
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:
m
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*&
_output_shapes
:

Read_10/DisableCopyOnReadDisableCopyOnRead/read_10_disablecopyonread_adam_m_conv2d_24_bias"/device:CPU:0*
_output_shapes
 ­
Read_10/ReadVariableOpReadVariableOp/read_10_disablecopyonread_adam_m_conv2d_24_bias^Read_10/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*
_output_shapes
:

Read_11/DisableCopyOnReadDisableCopyOnRead/read_11_disablecopyonread_adam_v_conv2d_24_bias"/device:CPU:0*
_output_shapes
 ­
Read_11/ReadVariableOpReadVariableOp/read_11_disablecopyonread_adam_v_conv2d_24_bias^Read_11/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*
_output_shapes
:

Read_12/DisableCopyOnReadDisableCopyOnRead1read_12_disablecopyonread_adam_m_conv2d_25_kernel"/device:CPU:0*
_output_shapes
 Л
Read_12/ReadVariableOpReadVariableOp1read_12_disablecopyonread_adam_m_conv2d_25_kernel^Read_12/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:

*
dtype0w
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:

m
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*&
_output_shapes
:


Read_13/DisableCopyOnReadDisableCopyOnRead1read_13_disablecopyonread_adam_v_conv2d_25_kernel"/device:CPU:0*
_output_shapes
 Л
Read_13/ReadVariableOpReadVariableOp1read_13_disablecopyonread_adam_v_conv2d_25_kernel^Read_13/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:

*
dtype0w
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:

m
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*&
_output_shapes
:


Read_14/DisableCopyOnReadDisableCopyOnRead/read_14_disablecopyonread_adam_m_conv2d_25_bias"/device:CPU:0*
_output_shapes
 ­
Read_14/ReadVariableOpReadVariableOp/read_14_disablecopyonread_adam_m_conv2d_25_bias^Read_14/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*
_output_shapes
:

Read_15/DisableCopyOnReadDisableCopyOnRead/read_15_disablecopyonread_adam_v_conv2d_25_bias"/device:CPU:0*
_output_shapes
 ­
Read_15/ReadVariableOpReadVariableOp/read_15_disablecopyonread_adam_v_conv2d_25_bias^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
:

Read_16/DisableCopyOnReadDisableCopyOnRead0read_16_disablecopyonread_adam_m_dense_14_kernel"/device:CPU:0*
_output_shapes
 Д
Read_16/ReadVariableOpReadVariableOp0read_16_disablecopyonread_adam_m_dense_14_kernel^Read_16/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
шу
*
dtype0q
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
шу
g
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0* 
_output_shapes
:
шу

Read_17/DisableCopyOnReadDisableCopyOnRead0read_17_disablecopyonread_adam_v_dense_14_kernel"/device:CPU:0*
_output_shapes
 Д
Read_17/ReadVariableOpReadVariableOp0read_17_disablecopyonread_adam_v_dense_14_kernel^Read_17/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
шу
*
dtype0q
Identity_34IdentityRead_17/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
шу
g
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0* 
_output_shapes
:
шу

Read_18/DisableCopyOnReadDisableCopyOnRead.read_18_disablecopyonread_adam_m_dense_14_bias"/device:CPU:0*
_output_shapes
 Ќ
Read_18/ReadVariableOpReadVariableOp.read_18_disablecopyonread_adam_m_dense_14_bias^Read_18/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*
_output_shapes
:

Read_19/DisableCopyOnReadDisableCopyOnRead.read_19_disablecopyonread_adam_v_dense_14_bias"/device:CPU:0*
_output_shapes
 Ќ
Read_19/ReadVariableOpReadVariableOp.read_19_disablecopyonread_adam_v_dense_14_bias^Read_19/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:
*
dtype0k
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:
a
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*
_output_shapes
:
v
Read_20/DisableCopyOnReadDisableCopyOnRead!read_20_disablecopyonread_total_1"/device:CPU:0*
_output_shapes
 
Read_20/ReadVariableOpReadVariableOp!read_20_disablecopyonread_total_1^Read_20/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*
_output_shapes
: v
Read_21/DisableCopyOnReadDisableCopyOnRead!read_21_disablecopyonread_count_1"/device:CPU:0*
_output_shapes
 
Read_21/ReadVariableOpReadVariableOp!read_21_disablecopyonread_count_1^Read_21/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_42IdentityRead_21/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_22/DisableCopyOnReadDisableCopyOnReadread_22_disablecopyonread_total"/device:CPU:0*
_output_shapes
 
Read_22/ReadVariableOpReadVariableOpread_22_disablecopyonread_total^Read_22/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_44IdentityRead_22/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_23/DisableCopyOnReadDisableCopyOnReadread_23_disablecopyonread_count"/device:CPU:0*
_output_shapes
 
Read_23/ReadVariableOpReadVariableOpread_23_disablecopyonread_count^Read_23/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_46IdentityRead_23/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*
_output_shapes
: њ

SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ѓ

value
B
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B ћ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *'
dtypes
2	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Г
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_48Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_49IdentityIdentity_48:output:0^NoOp*
T0*
_output_shapes
: 

NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*
_output_shapes
 "#
identity_49Identity_49:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4: : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp26
Read_16/DisableCopyOnReadRead_16/DisableCopyOnRead20
Read_16/ReadVariableOpRead_16/ReadVariableOp26
Read_17/DisableCopyOnReadRead_17/DisableCopyOnRead20
Read_17/ReadVariableOpRead_17/ReadVariableOp26
Read_18/DisableCopyOnReadRead_18/DisableCopyOnRead20
Read_18/ReadVariableOpRead_18/ReadVariableOp26
Read_19/DisableCopyOnReadRead_19/DisableCopyOnRead20
Read_19/ReadVariableOpRead_19/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp26
Read_20/DisableCopyOnReadRead_20/DisableCopyOnRead20
Read_20/ReadVariableOpRead_20/ReadVariableOp26
Read_21/DisableCopyOnReadRead_21/DisableCopyOnRead20
Read_21/ReadVariableOpRead_21/ReadVariableOp26
Read_22/DisableCopyOnReadRead_22/DisableCopyOnRead20
Read_22/ReadVariableOpRead_22/ReadVariableOp26
Read_23/DisableCopyOnReadRead_23/DisableCopyOnRead20
Read_23/ReadVariableOpRead_23/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:0,
*
_user_specified_nameconv2d_24/kernel:.*
(
_user_specified_nameconv2d_24/bias:0,
*
_user_specified_nameconv2d_25/kernel:.*
(
_user_specified_nameconv2d_25/bias:/+
)
_user_specified_namedense_14/kernel:-)
'
_user_specified_namedense_14/bias:)%
#
_user_specified_name	iteration:-)
'
_user_specified_namelearning_rate:7	3
1
_user_specified_nameAdam/m/conv2d_24/kernel:7
3
1
_user_specified_nameAdam/v/conv2d_24/kernel:51
/
_user_specified_nameAdam/m/conv2d_24/bias:51
/
_user_specified_nameAdam/v/conv2d_24/bias:73
1
_user_specified_nameAdam/m/conv2d_25/kernel:73
1
_user_specified_nameAdam/v/conv2d_25/kernel:51
/
_user_specified_nameAdam/m/conv2d_25/bias:51
/
_user_specified_nameAdam/v/conv2d_25/bias:62
0
_user_specified_nameAdam/m/dense_14/kernel:62
0
_user_specified_nameAdam/v/dense_14/kernel:40
.
_user_specified_nameAdam/m/dense_14/bias:40
.
_user_specified_nameAdam/v/dense_14/bias:'#
!
_user_specified_name	total_1:'#
!
_user_specified_name	count_1:%!

_user_specified_nametotal:%!

_user_specified_namecount:=9

_output_shapes
: 

_user_specified_nameConst
Ш
`
D__inference_flatten_9_layer_call_and_return_conditional_losses_47205

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџшq  ^
ReshapeReshapeinputsConst:output:0*
T0*)
_output_shapes
:џџџџџџџџџшуZ
IdentityIdentityReshape:output:0*
T0*)
_output_shapes
:џџџџџџџџџшу"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ66
:W S
/
_output_shapes
:џџџџџџџџџ66

 
_user_specified_nameinputs
Я
V
"__inference__update_step_xla_47109
gradient"
variable:
*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:
: *
	_noinline(:P L
&
_output_shapes
:

"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ћ
J
"__inference__update_step_xla_47114
gradient
variable:
*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:
: *
	_noinline(:D @

_output_shapes
:

"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Л
L
0__inference_max_pooling2d_15_layer_call_fn_47159

inputs
identityм
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_46920
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
њ

 
,__inference_sequential_9_layer_call_fn_47052
conv2d_24_input!
unknown:

	unknown_0:
#
	unknown_1:


	unknown_2:

	unknown_3:
шу

	unknown_4:

identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv2d_24_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_47018o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:%!

_user_specified_name47038:%!

_user_specified_name47040:%!

_user_specified_name47042:%!

_user_specified_name47044:%!

_user_specified_name47046:%!

_user_specified_name47048
ќ+
 
 __inference__wrapped_model_46915
conv2d_24_inputO
5sequential_9_conv2d_24_conv2d_readvariableop_resource:
D
6sequential_9_conv2d_24_biasadd_readvariableop_resource:
O
5sequential_9_conv2d_25_conv2d_readvariableop_resource:

D
6sequential_9_conv2d_25_biasadd_readvariableop_resource:
H
4sequential_9_dense_14_matmul_readvariableop_resource:
шу
C
5sequential_9_dense_14_biasadd_readvariableop_resource:

identityЂ-sequential_9/conv2d_24/BiasAdd/ReadVariableOpЂ,sequential_9/conv2d_24/Conv2D/ReadVariableOpЂ-sequential_9/conv2d_25/BiasAdd/ReadVariableOpЂ,sequential_9/conv2d_25/Conv2D/ReadVariableOpЂ,sequential_9/dense_14/BiasAdd/ReadVariableOpЂ+sequential_9/dense_14/MatMul/ReadVariableOpЊ
,sequential_9/conv2d_24/Conv2D/ReadVariableOpReadVariableOp5sequential_9_conv2d_24_conv2d_readvariableop_resource*&
_output_shapes
:
*
dtype0г
sequential_9/conv2d_24/Conv2DConv2Dconv2d_24_input4sequential_9/conv2d_24/Conv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо
*
paddingVALID*
strides
 
-sequential_9/conv2d_24/BiasAdd/ReadVariableOpReadVariableOp6sequential_9_conv2d_24_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0Ф
sequential_9/conv2d_24/BiasAddBiasAdd&sequential_9/conv2d_24/Conv2D:output:05sequential_9/conv2d_24/BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо

sequential_9/conv2d_24/ReluRelu'sequential_9/conv2d_24/BiasAdd:output:0*
T0*1
_output_shapes
:џџџџџџџџџоо
Ш
%sequential_9/max_pooling2d_15/MaxPoolMaxPool)sequential_9/conv2d_24/Relu:activations:0*/
_output_shapes
:џџџџџџџџџoo
*
ksize
*
paddingVALID*
strides
Њ
,sequential_9/conv2d_25/Conv2D/ReadVariableOpReadVariableOp5sequential_9_conv2d_25_conv2d_readvariableop_resource*&
_output_shapes
:

*
dtype0№
sequential_9/conv2d_25/Conv2DConv2D.sequential_9/max_pooling2d_15/MaxPool:output:04sequential_9/conv2d_25/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm
*
paddingVALID*
strides
 
-sequential_9/conv2d_25/BiasAdd/ReadVariableOpReadVariableOp6sequential_9_conv2d_25_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0Т
sequential_9/conv2d_25/BiasAddBiasAdd&sequential_9/conv2d_25/Conv2D:output:05sequential_9/conv2d_25/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm

sequential_9/conv2d_25/ReluRelu'sequential_9/conv2d_25/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџmm
Ш
%sequential_9/max_pooling2d_16/MaxPoolMaxPool)sequential_9/conv2d_25/Relu:activations:0*/
_output_shapes
:џџџџџџџџџ66
*
ksize
*
paddingVALID*
strides
m
sequential_9/flatten_9/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџшq  Д
sequential_9/flatten_9/ReshapeReshape.sequential_9/max_pooling2d_16/MaxPool:output:0%sequential_9/flatten_9/Const:output:0*
T0*)
_output_shapes
:џџџџџџџџџшуЂ
+sequential_9/dense_14/MatMul/ReadVariableOpReadVariableOp4sequential_9_dense_14_matmul_readvariableop_resource* 
_output_shapes
:
шу
*
dtype0Ж
sequential_9/dense_14/MatMulMatMul'sequential_9/flatten_9/Reshape:output:03sequential_9/dense_14/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ

,sequential_9/dense_14/BiasAdd/ReadVariableOpReadVariableOp5sequential_9_dense_14_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0И
sequential_9/dense_14/BiasAddBiasAdd&sequential_9/dense_14/MatMul:product:04sequential_9/dense_14/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ

sequential_9/dense_14/SoftmaxSoftmax&sequential_9/dense_14/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
v
IdentityIdentity'sequential_9/dense_14/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
Н
NoOpNoOp.^sequential_9/conv2d_24/BiasAdd/ReadVariableOp-^sequential_9/conv2d_24/Conv2D/ReadVariableOp.^sequential_9/conv2d_25/BiasAdd/ReadVariableOp-^sequential_9/conv2d_25/Conv2D/ReadVariableOp-^sequential_9/dense_14/BiasAdd/ReadVariableOp,^sequential_9/dense_14/MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 2^
-sequential_9/conv2d_24/BiasAdd/ReadVariableOp-sequential_9/conv2d_24/BiasAdd/ReadVariableOp2\
,sequential_9/conv2d_24/Conv2D/ReadVariableOp,sequential_9/conv2d_24/Conv2D/ReadVariableOp2^
-sequential_9/conv2d_25/BiasAdd/ReadVariableOp-sequential_9/conv2d_25/BiasAdd/ReadVariableOp2\
,sequential_9/conv2d_25/Conv2D/ReadVariableOp,sequential_9/conv2d_25/Conv2D/ReadVariableOp2\
,sequential_9/dense_14/BiasAdd/ReadVariableOp,sequential_9/dense_14/BiasAdd/ReadVariableOp2Z
+sequential_9/dense_14/MatMul/ReadVariableOp+sequential_9/dense_14/MatMul/ReadVariableOp:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource

g
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_46920

inputs
identityЂ
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ы
P
"__inference__update_step_xla_47129
gradient
variable:
шу
*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ
: *
	_noinline(:Q M
'
_output_shapes
:џџџџџџџџџ

"
_user_specified_name
gradient:($
"
_user_specified_name
variable


)__inference_conv2d_24_layer_call_fn_47143

inputs!
unknown:

	unknown_0:

identityЂStatefulPartitionedCallц
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:џџџџџџџџџоо
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_46948y
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*1
_output_shapes
:џџџџџџџџџоо
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:џџџџџџџџџрр: : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
1
_output_shapes
:џџџџџџџџџрр
 
_user_specified_nameinputs:%!

_user_specified_name47137:%!

_user_specified_name47139

g
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_47164

inputs
identityЂ
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
з

і
C__inference_dense_14_layer_call_and_return_conditional_losses_46989

inputs2
matmul_readvariableop_resource:
шу
-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
шу
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџшу: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:Q M
)
_output_shapes
:џџџџџџџџџшу
 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
Я
V
"__inference__update_step_xla_47119
gradient"
variable:

*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:

: *
	_noinline(:P L
&
_output_shapes
:


"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ш
`
D__inference_flatten_9_layer_call_and_return_conditional_losses_46977

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџшq  ^
ReshapeReshapeinputsConst:output:0*
T0*)
_output_shapes
:џџџџџџџџџшуZ
IdentityIdentityReshape:output:0*
T0*)
_output_shapes
:џџџџџџџџџшу"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ66
:W S
/
_output_shapes
:џџџџџџџџџ66

 
_user_specified_nameinputs
Л
L
0__inference_max_pooling2d_16_layer_call_fn_47189

inputs
identityм
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_46930
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
ѓ

(__inference_dense_14_layer_call_fn_47214

inputs
unknown:
шу

	unknown_0:

identityЂStatefulPartitionedCallл
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_dense_14_layer_call_and_return_conditional_losses_46989o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџшу: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
)
_output_shapes
:џџџџџџџџџшу
 
_user_specified_nameinputs:%!

_user_specified_name47208:%!

_user_specified_name47210
Р
§
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47154

inputs8
conv2d_readvariableop_resource:
-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:
*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо
*
paddingVALID*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо
Z
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:џџџџџџџџџоо
k
IdentityIdentityRelu:activations:0^NoOp*
T0*1
_output_shapes
:џџџџџџџџџоо
S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:џџџџџџџџџрр: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:џџџџџџџџџрр
 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
Д
§
D__inference_conv2d_25_layer_call_and_return_conditional_losses_46965

inputs8
conv2d_readvariableop_resource:

-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:

*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm
*
paddingVALID*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm
X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџmm
i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџmm
S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџoo
: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџoo

 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
Р
§
D__inference_conv2d_24_layer_call_and_return_conditional_losses_46948

inputs8
conv2d_readvariableop_resource:
-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:
*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо
*
paddingVALID*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*1
_output_shapes
:џџџџџџџџџоо
Z
ReluReluBiasAdd:output:0*
T0*1
_output_shapes
:џџџџџџџџџоо
k
IdentityIdentityRelu:activations:0^NoOp*
T0*1
_output_shapes
:џџџџџџџџџоо
S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:џџџџџџџџџрр: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:Y U
1
_output_shapes
:џџџџџџџџџрр
 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
Д
E
)__inference_flatten_9_layer_call_fn_47199

inputs
identityД
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:џџџџџџџџџшу* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_9_layer_call_and_return_conditional_losses_46977b
IdentityIdentityPartitionedCall:output:0*
T0*)
_output_shapes
:џџџџџџџџџшу"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ66
:W S
/
_output_shapes
:џџџџџџџџџ66

 
_user_specified_nameinputs
Ћ
J
"__inference__update_step_xla_47134
gradient
variable:
*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:
: *
	_noinline(:D @

_output_shapes
:

"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Д
§
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47184

inputs8
conv2d_readvariableop_resource:

-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:

*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm
*
paddingVALID*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџmm
X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџmm
i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџmm
S
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџoo
: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџoo

 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
љ
А
G__inference_sequential_9_layer_call_and_return_conditional_losses_46996
conv2d_24_input)
conv2d_24_46949:

conv2d_24_46951:
)
conv2d_25_46966:


conv2d_25_46968:
"
dense_14_46990:
шу

dense_14_46992:

identityЂ!conv2d_24/StatefulPartitionedCallЂ!conv2d_25/StatefulPartitionedCallЂ dense_14/StatefulPartitionedCall
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCallconv2d_24_inputconv2d_24_46949conv2d_24_46951*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:џџџџџџџџџоо
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_46948і
 max_pooling2d_15/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџoo
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_46920
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_15/PartitionedCall:output:0conv2d_25_46966conv2d_25_46968*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџmm
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_46965і
 max_pooling2d_16/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ66
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_46930с
flatten_9/PartitionedCallPartitionedCall)max_pooling2d_16/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:џџџџџџџџџшу* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_9_layer_call_and_return_conditional_losses_46977
 dense_14/StatefulPartitionedCallStatefulPartitionedCall"flatten_9/PartitionedCall:output:0dense_14_46990dense_14_46992*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_dense_14_layer_call_and_return_conditional_losses_46989x
IdentityIdentity)dense_14/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ

NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall!^dense_14/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2D
 dense_14/StatefulPartitionedCall dense_14/StatefulPartitionedCall:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:%!

_user_specified_name46949:%!

_user_specified_name46951:%!

_user_specified_name46966:%!

_user_specified_name46968:%!

_user_specified_name46990:%!

_user_specified_name46992
љ
А
G__inference_sequential_9_layer_call_and_return_conditional_losses_47018
conv2d_24_input)
conv2d_24_46999:

conv2d_24_47001:
)
conv2d_25_47005:


conv2d_25_47007:
"
dense_14_47012:
шу

dense_14_47014:

identityЂ!conv2d_24/StatefulPartitionedCallЂ!conv2d_25/StatefulPartitionedCallЂ dense_14/StatefulPartitionedCall
!conv2d_24/StatefulPartitionedCallStatefulPartitionedCallconv2d_24_inputconv2d_24_46999conv2d_24_47001*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:џџџџџџџџџоо
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_24_layer_call_and_return_conditional_losses_46948і
 max_pooling2d_15/PartitionedCallPartitionedCall*conv2d_24/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџoo
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_46920
!conv2d_25/StatefulPartitionedCallStatefulPartitionedCall)max_pooling2d_15/PartitionedCall:output:0conv2d_25_47005conv2d_25_47007*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџmm
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_46965і
 max_pooling2d_16/PartitionedCallPartitionedCall*conv2d_25/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ66
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_46930с
flatten_9/PartitionedCallPartitionedCall)max_pooling2d_16/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *)
_output_shapes
:џџџџџџџџџшу* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_9_layer_call_and_return_conditional_losses_46977
 dense_14/StatefulPartitionedCallStatefulPartitionedCall"flatten_9/PartitionedCall:output:0dense_14_47012dense_14_47014*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_dense_14_layer_call_and_return_conditional_losses_46989x
IdentityIdentity)dense_14/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ

NoOpNoOp"^conv2d_24/StatefulPartitionedCall"^conv2d_25/StatefulPartitionedCall!^dense_14/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 2F
!conv2d_24/StatefulPartitionedCall!conv2d_24/StatefulPartitionedCall2F
!conv2d_25/StatefulPartitionedCall!conv2d_25/StatefulPartitionedCall2D
 dense_14/StatefulPartitionedCall dense_14/StatefulPartitionedCall:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:%!

_user_specified_name46999:%!

_user_specified_name47001:%!

_user_specified_name47005:%!

_user_specified_name47007:%!

_user_specified_name47012:%!

_user_specified_name47014


)__inference_conv2d_25_layer_call_fn_47173

inputs!
unknown:


	unknown_0:

identityЂStatefulPartitionedCallф
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџmm
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_conv2d_25_layer_call_and_return_conditional_losses_46965w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџmm
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџoo
: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџoo

 
_user_specified_nameinputs:%!

_user_specified_name47167:%!

_user_specified_name47169
јp
ь
!__inference__traced_restore_47472
file_prefix;
!assignvariableop_conv2d_24_kernel:
/
!assignvariableop_1_conv2d_24_bias:
=
#assignvariableop_2_conv2d_25_kernel:

/
!assignvariableop_3_conv2d_25_bias:
6
"assignvariableop_4_dense_14_kernel:
шу
.
 assignvariableop_5_dense_14_bias:
&
assignvariableop_6_iteration:	 *
 assignvariableop_7_learning_rate: D
*assignvariableop_8_adam_m_conv2d_24_kernel:
D
*assignvariableop_9_adam_v_conv2d_24_kernel:
7
)assignvariableop_10_adam_m_conv2d_24_bias:
7
)assignvariableop_11_adam_v_conv2d_24_bias:
E
+assignvariableop_12_adam_m_conv2d_25_kernel:

E
+assignvariableop_13_adam_v_conv2d_25_kernel:

7
)assignvariableop_14_adam_m_conv2d_25_bias:
7
)assignvariableop_15_adam_v_conv2d_25_bias:
>
*assignvariableop_16_adam_m_dense_14_kernel:
шу
>
*assignvariableop_17_adam_v_dense_14_kernel:
шу
6
(assignvariableop_18_adam_m_dense_14_bias:
6
(assignvariableop_19_adam_v_dense_14_bias:
%
assignvariableop_20_total_1: %
assignvariableop_21_count_1: #
assignvariableop_22_total: #
assignvariableop_23_count: 
identity_25ЂAssignVariableOpЂAssignVariableOp_1ЂAssignVariableOp_10ЂAssignVariableOp_11ЂAssignVariableOp_12ЂAssignVariableOp_13ЂAssignVariableOp_14ЂAssignVariableOp_15ЂAssignVariableOp_16ЂAssignVariableOp_17ЂAssignVariableOp_18ЂAssignVariableOp_19ЂAssignVariableOp_2ЂAssignVariableOp_20ЂAssignVariableOp_21ЂAssignVariableOp_22ЂAssignVariableOp_23ЂAssignVariableOp_3ЂAssignVariableOp_4ЂAssignVariableOp_5ЂAssignVariableOp_6ЂAssignVariableOp_7ЂAssignVariableOp_8ЂAssignVariableOp_9§

RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ѓ

value
B
B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЂ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B 
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*x
_output_shapesf
d:::::::::::::::::::::::::*'
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOpAssignVariableOp!assignvariableop_conv2d_24_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_1AssignVariableOp!assignvariableop_1_conv2d_24_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_2AssignVariableOp#assignvariableop_2_conv2d_25_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_3AssignVariableOp!assignvariableop_3_conv2d_25_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:Й
AssignVariableOp_4AssignVariableOp"assignvariableop_4_dense_14_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:З
AssignVariableOp_5AssignVariableOp assignvariableop_5_dense_14_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0	*
_output_shapes
:Г
AssignVariableOp_6AssignVariableOpassignvariableop_6_iterationIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:З
AssignVariableOp_7AssignVariableOp assignvariableop_7_learning_rateIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_8AssignVariableOp*assignvariableop_8_adam_m_conv2d_24_kernelIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_9AssignVariableOp*assignvariableop_9_adam_v_conv2d_24_kernelIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_10AssignVariableOp)assignvariableop_10_adam_m_conv2d_24_biasIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_11AssignVariableOp)assignvariableop_11_adam_v_conv2d_24_biasIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_12AssignVariableOp+assignvariableop_12_adam_m_conv2d_25_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_13AssignVariableOp+assignvariableop_13_adam_v_conv2d_25_kernelIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_14AssignVariableOp)assignvariableop_14_adam_m_conv2d_25_biasIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_15AssignVariableOp)assignvariableop_15_adam_v_conv2d_25_biasIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_16AssignVariableOp*assignvariableop_16_adam_m_dense_14_kernelIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_17AssignVariableOp*assignvariableop_17_adam_v_dense_14_kernelIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_18AssignVariableOp(assignvariableop_18_adam_m_dense_14_biasIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_19AssignVariableOp(assignvariableop_19_adam_v_dense_14_biasIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_20AssignVariableOpassignvariableop_20_total_1Identity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_21AssignVariableOpassignvariableop_21_count_1Identity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:В
AssignVariableOp_22AssignVariableOpassignvariableop_22_totalIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:В
AssignVariableOp_23AssignVariableOpassignvariableop_23_countIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 п
Identity_24Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_25IdentityIdentity_24:output:0^NoOp_1*
T0*
_output_shapes
: Ј
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
_output_shapes
 "#
identity_25Identity_25:output:0*(
_construction_contextkEagerRuntime*E
_input_shapes4
2: : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:0,
*
_user_specified_nameconv2d_24/kernel:.*
(
_user_specified_nameconv2d_24/bias:0,
*
_user_specified_nameconv2d_25/kernel:.*
(
_user_specified_nameconv2d_25/bias:/+
)
_user_specified_namedense_14/kernel:-)
'
_user_specified_namedense_14/bias:)%
#
_user_specified_name	iteration:-)
'
_user_specified_namelearning_rate:7	3
1
_user_specified_nameAdam/m/conv2d_24/kernel:7
3
1
_user_specified_nameAdam/v/conv2d_24/kernel:51
/
_user_specified_nameAdam/m/conv2d_24/bias:51
/
_user_specified_nameAdam/v/conv2d_24/bias:73
1
_user_specified_nameAdam/m/conv2d_25/kernel:73
1
_user_specified_nameAdam/v/conv2d_25/kernel:51
/
_user_specified_nameAdam/m/conv2d_25/bias:51
/
_user_specified_nameAdam/v/conv2d_25/bias:62
0
_user_specified_nameAdam/m/dense_14/kernel:62
0
_user_specified_nameAdam/v/dense_14/kernel:40
.
_user_specified_nameAdam/m/dense_14/bias:40
.
_user_specified_nameAdam/v/dense_14/bias:'#
!
_user_specified_name	total_1:'#
!
_user_specified_name	count_1:%!

_user_specified_nametotal:%!

_user_specified_namecount
њ

 
,__inference_sequential_9_layer_call_fn_47035
conv2d_24_input!
unknown:

	unknown_0:
#
	unknown_1:


	unknown_2:

	unknown_3:
шу

	unknown_4:

identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv2d_24_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ
*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_9_layer_call_and_return_conditional_losses_46996o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):џџџџџџџџџрр: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:b ^
1
_output_shapes
:џџџџџџџџџрр
)
_user_specified_nameconv2d_24_input:%!

_user_specified_name47021:%!

_user_specified_name47023:%!

_user_specified_name47025:%!

_user_specified_name47027:%!

_user_specified_name47029:%!

_user_specified_name47031
з

і
C__inference_dense_14_layer_call_and_return_conditional_losses_47225

inputs2
matmul_readvariableop_resource:
шу
-
biasadd_readvariableop_resource:

identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
шу
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџшу: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:Q M
)
_output_shapes
:џџџџџџџџџшу
 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource"эL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Х
serving_defaultБ
U
conv2d_24_inputB
!serving_default_conv2d_24_input:0џџџџџџџџџрр<
dense_140
StatefulPartitionedCall:0џџџџџџџџџ
tensorflow/serving/predict:ьЌ

layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer-4
layer_with_weights-2
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_sequential
н
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias
 _jit_compiled_convolution_op"
_tf_keras_layer
Ѕ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
н
	variables
 trainable_variables
!regularization_losses
"	keras_api
#__call__
*$&call_and_return_all_conditional_losses

%kernel
&bias
 '_jit_compiled_convolution_op"
_tf_keras_layer
Ѕ
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses"
_tf_keras_layer
Ѕ
.	variables
/trainable_variables
0regularization_losses
1	keras_api
2__call__
*3&call_and_return_all_conditional_losses"
_tf_keras_layer
Л
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses

:kernel
;bias"
_tf_keras_layer
J
0
1
%2
&3
:4
;5"
trackable_list_wrapper
J
0
1
%2
&3
:4
;5"
trackable_list_wrapper
 "
trackable_list_wrapper
Ъ
<non_trainable_variables

=layers
>metrics
?layer_regularization_losses
@layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ы
Atrace_0
Btrace_12
,__inference_sequential_9_layer_call_fn_47035
,__inference_sequential_9_layer_call_fn_47052Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zAtrace_0zBtrace_1

Ctrace_0
Dtrace_12Ъ
G__inference_sequential_9_layer_call_and_return_conditional_losses_46996
G__inference_sequential_9_layer_call_and_return_conditional_losses_47018Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zCtrace_0zDtrace_1
гBа
 __inference__wrapped_model_46915conv2d_24_input"
В
FullArgSpec
args

jargs_0
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

E
_variables
F_iterations
G_learning_rate
H_index_dict
I
_momentums
J_velocities
K_update_step_xla"
experimentalOptimizer
,
Lserving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
у
Rtrace_02Ц
)__inference_conv2d_24_layer_call_fn_47143
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zRtrace_0
ў
Strace_02с
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47154
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zStrace_0
*:(
2conv2d_24/kernel
:
2conv2d_24/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
Tnon_trainable_variables

Ulayers
Vmetrics
Wlayer_regularization_losses
Xlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ъ
Ytrace_02Э
0__inference_max_pooling2d_15_layer_call_fn_47159
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zYtrace_0

Ztrace_02ш
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_47164
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zZtrace_0
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
[non_trainable_variables

\layers
]metrics
^layer_regularization_losses
_layer_metrics
	variables
 trainable_variables
!regularization_losses
#__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses"
_generic_user_object
у
`trace_02Ц
)__inference_conv2d_25_layer_call_fn_47173
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z`trace_0
ў
atrace_02с
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47184
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zatrace_0
*:(

2conv2d_25/kernel
:
2conv2d_25/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses"
_generic_user_object
ъ
gtrace_02Э
0__inference_max_pooling2d_16_layer_call_fn_47189
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zgtrace_0

htrace_02ш
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_47194
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zhtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
inon_trainable_variables

jlayers
kmetrics
llayer_regularization_losses
mlayer_metrics
.	variables
/trainable_variables
0regularization_losses
2__call__
*3&call_and_return_all_conditional_losses
&3"call_and_return_conditional_losses"
_generic_user_object
у
ntrace_02Ц
)__inference_flatten_9_layer_call_fn_47199
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zntrace_0
ў
otrace_02с
D__inference_flatten_9_layer_call_and_return_conditional_losses_47205
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zotrace_0
.
:0
;1"
trackable_list_wrapper
.
:0
;1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
pnon_trainable_variables

qlayers
rmetrics
slayer_regularization_losses
tlayer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses"
_generic_user_object
т
utrace_02Х
(__inference_dense_14_layer_call_fn_47214
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zutrace_0
§
vtrace_02р
C__inference_dense_14_layer_call_and_return_conditional_losses_47225
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zvtrace_0
#:!
шу
2dense_14/kernel
:
2dense_14/bias
 "
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
.
w0
x1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ѓB№
,__inference_sequential_9_layer_call_fn_47035conv2d_24_input"Ќ
ЅВЁ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѓB№
,__inference_sequential_9_layer_call_fn_47052conv2d_24_input"Ќ
ЅВЁ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_9_layer_call_and_return_conditional_losses_46996conv2d_24_input"Ќ
ЅВЁ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_9_layer_call_and_return_conditional_losses_47018conv2d_24_input"Ќ
ЅВЁ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

F0
y1
z2
{3
|4
}5
~6
7
8
9
10
11
12"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
L
y0
{1
}2
3
4
5"
trackable_list_wrapper
M
z0
|1
~2
3
4
5"
trackable_list_wrapper
Е
trace_0
trace_1
trace_2
trace_3
trace_4
trace_52
"__inference__update_step_xla_47109
"__inference__update_step_xla_47114
"__inference__update_step_xla_47119
"__inference__update_step_xla_47124
"__inference__update_step_xla_47129
"__inference__update_step_xla_47134Џ
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0ztrace_0ztrace_1ztrace_2ztrace_3ztrace_4ztrace_5
пBм
#__inference_signature_wrapper_47104conv2d_24_input"Ё
В
FullArgSpec
args 
varargs
 
varkw
 
defaults
 $

kwonlyargs
jconv2d_24_input
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
гBа
)__inference_conv2d_24_layer_call_fn_47143inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
юBы
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47154inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
кBз
0__inference_max_pooling2d_15_layer_call_fn_47159inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѕBђ
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_47164inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
гBа
)__inference_conv2d_25_layer_call_fn_47173inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
юBы
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47184inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
кBз
0__inference_max_pooling2d_16_layer_call_fn_47189inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѕBђ
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_47194inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
гBа
)__inference_flatten_9_layer_call_fn_47199inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
юBы
D__inference_flatten_9_layer_call_and_return_conditional_losses_47205inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
вBЯ
(__inference_dense_14_layer_call_fn_47214inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
C__inference_dense_14_layer_call_and_return_conditional_losses_47225inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
R
	variables
	keras_api

total

count"
_tf_keras_metric
c
	variables
	keras_api

total

count

_fn_kwargs"
_tf_keras_metric
/:-
2Adam/m/conv2d_24/kernel
/:-
2Adam/v/conv2d_24/kernel
!:
2Adam/m/conv2d_24/bias
!:
2Adam/v/conv2d_24/bias
/:-

2Adam/m/conv2d_25/kernel
/:-

2Adam/v/conv2d_25/kernel
!:
2Adam/m/conv2d_25/bias
!:
2Adam/v/conv2d_25/bias
(:&
шу
2Adam/m/dense_14/kernel
(:&
шу
2Adam/v/dense_14/kernel
 :
2Adam/m/dense_14/bias
 :
2Adam/v/dense_14/bias
эBъ
"__inference__update_step_xla_47109gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
"__inference__update_step_xla_47114gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
"__inference__update_step_xla_47119gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
"__inference__update_step_xla_47124gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
"__inference__update_step_xla_47129gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
эBъ
"__inference__update_step_xla_47134gradientvariable"­
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
0
1"
trackable_list_wrapper
.
	variables"
_generic_user_object
:  (2total
:  (2count
0
0
1"
trackable_list_wrapper
.
	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapperЄ
"__inference__update_step_xla_47109~xЂu
nЂk
!
gradient

<9	%Ђ"
њ


p
` VariableSpec 
`РйђєЯШ?
Њ "
 
"__inference__update_step_xla_47114f`Ђ]
VЂS

gradient

0-	Ђ
њ


p
` VariableSpec 
` гђєЯШ?
Њ "
 Є
"__inference__update_step_xla_47119~xЂu
nЂk
!
gradient


<9	%Ђ"
њ



p
` VariableSpec 
`рѓђєЯШ?
Њ "
 
"__inference__update_step_xla_47124f`Ђ]
VЂS

gradient

0-	Ђ
њ


p
` VariableSpec 
` тђєЯШ?
Њ "
 
"__inference__update_step_xla_47129ysЂp
iЂf
"
gradientџџџџџџџџџ

63	Ђ
њ
шу


p
` VariableSpec 
` СѓєЯШ?
Њ "
 
"__inference__update_step_xla_47134f`Ђ]
VЂS

gradient

0-	Ђ
њ


p
` VariableSpec 
`рОѓєЯШ?
Њ "
 І
 __inference__wrapped_model_46915%&:;BЂ?
8Ђ5
30
conv2d_24_inputџџџџџџџџџрр
Њ "3Њ0
.
dense_14"
dense_14џџџџџџџџџ
П
D__inference_conv2d_24_layer_call_and_return_conditional_losses_47154w9Ђ6
/Ђ,
*'
inputsџџџџџџџџџрр
Њ "6Ђ3
,)
tensor_0џџџџџџџџџоо

 
)__inference_conv2d_24_layer_call_fn_47143l9Ђ6
/Ђ,
*'
inputsџџџџџџџџџрр
Њ "+(
unknownџџџџџџџџџоо
Л
D__inference_conv2d_25_layer_call_and_return_conditional_losses_47184s%&7Ђ4
-Ђ*
(%
inputsџџџџџџџџџoo

Њ "4Ђ1
*'
tensor_0џџџџџџџџџmm

 
)__inference_conv2d_25_layer_call_fn_47173h%&7Ђ4
-Ђ*
(%
inputsџџџџџџџџџoo

Њ ")&
unknownџџџџџџџџџmm
Ќ
C__inference_dense_14_layer_call_and_return_conditional_losses_47225e:;1Ђ.
'Ђ$
"
inputsџџџџџџџџџшу
Њ ",Ђ)
"
tensor_0џџџџџџџџџ

 
(__inference_dense_14_layer_call_fn_47214Z:;1Ђ.
'Ђ$
"
inputsџџџџџџџџџшу
Њ "!
unknownџџџџџџџџџ
Б
D__inference_flatten_9_layer_call_and_return_conditional_losses_47205i7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ66

Њ ".Ђ+
$!
tensor_0џџџџџџџџџшу
 
)__inference_flatten_9_layer_call_fn_47199^7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ66

Њ "# 
unknownџџџџџџџџџшуѕ
K__inference_max_pooling2d_15_layer_call_and_return_conditional_losses_47164ЅRЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "OЂL
EB
tensor_04џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 Я
0__inference_max_pooling2d_15_layer_call_fn_47159RЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "DA
unknown4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѕ
K__inference_max_pooling2d_16_layer_call_and_return_conditional_losses_47194ЅRЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "OЂL
EB
tensor_04џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 Я
0__inference_max_pooling2d_16_layer_call_fn_47189RЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "DA
unknown4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџЮ
G__inference_sequential_9_layer_call_and_return_conditional_losses_46996%&:;JЂG
@Ђ=
30
conv2d_24_inputџџџџџџџџџрр
p

 
Њ ",Ђ)
"
tensor_0џџџџџџџџџ

 Ю
G__inference_sequential_9_layer_call_and_return_conditional_losses_47018%&:;JЂG
@Ђ=
30
conv2d_24_inputџџџџџџџџџрр
p 

 
Њ ",Ђ)
"
tensor_0џџџџџџџџџ

 Ї
,__inference_sequential_9_layer_call_fn_47035w%&:;JЂG
@Ђ=
30
conv2d_24_inputџџџџџџџџџрр
p

 
Њ "!
unknownџџџџџџџџџ
Ї
,__inference_sequential_9_layer_call_fn_47052w%&:;JЂG
@Ђ=
30
conv2d_24_inputџџџџџџџџџрр
p 

 
Њ "!
unknownџџџџџџџџџ
М
#__inference_signature_wrapper_47104%&:;UЂR
Ђ 
KЊH
F
conv2d_24_input30
conv2d_24_inputџџџџџџџџџрр"3Њ0
.
dense_14"
dense_14џџџџџџџџџ
