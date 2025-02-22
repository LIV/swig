/* -----------------------------------------------------------------------------
 * csharphead.swg
 *
 * Support code for exceptions if the SWIG_CSHARP_NO_EXCEPTION_HELPER is not defined
 * Support code for strings if the SWIG_CSHARP_NO_STRING_HELPER is not defined
 * ----------------------------------------------------------------------------- */

#if defined(SWIG_CSHARP_MONO_AOT_COMPATIBILITY)
%insert(runtime) %{
#define SWIG_csharp_string_callback const_cast<char*>
%}
#endif

%insert(runtime) %{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
%}

#if defined(SWIG_CSHARP_MONO_AOT_COMPATIBILITY)
%pragma(csharp) imclasscode=%{
  /// For Mono AOT platforms compatibility
  /// This attribute can be defined in any assembly for Mono AOT to use it.
  public class MonoPInvokeCallbackAttribute : global::System.Attribute {
    public MonoPInvokeCallbackAttribute(global::System.Type t) {
    }
  }
%}
%pragma(csharp) modulecode=%{
#if NET5_0_OR_GREATER  
  [global::System.Runtime.CompilerServices.ModuleInitializer]
  internal static void Init()
  {
    System.Runtime.CompilerServices.RuntimeHelpers.RunClassConstructor(typeof($imclassname.SWIGGCHandleHelper).TypeHandle);
    System.Runtime.CompilerServices.RuntimeHelpers.RunClassConstructor(typeof($imclassname.SWIGPendingException).TypeHandle);
  }
#endif
%}

#endif

#if !defined(SWIG_CSHARP_NO_EXCEPTION_HELPER)
%insert(runtime) %{
/* Support for throwing C# exceptions from C/C++. There are two types: 
 * Exceptions that take a message and ArgumentExceptions that take a message and a parameter name. */
typedef enum {
  SWIG_CSharpApplicationException,
  SWIG_CSharpArithmeticException,
  SWIG_CSharpDivideByZeroException,
  SWIG_CSharpIndexOutOfRangeException,
  SWIG_CSharpInvalidCastException,
  SWIG_CSharpInvalidOperationException,
  SWIG_CSharpIOException,
  SWIG_CSharpNullReferenceException,
  SWIG_CSharpOutOfMemoryException,
  SWIG_CSharpOverflowException,
  SWIG_CSharpSystemException
} SWIG_CSharpExceptionCodes;

typedef enum {
  SWIG_CSharpArgumentException,
  SWIG_CSharpArgumentNullException,
  SWIG_CSharpArgumentOutOfRangeException
} SWIG_CSharpExceptionArgumentCodes;

typedef void (SWIGSTDCALL* SWIG_CSharpExceptionCallback_t)(const char *);
typedef void (SWIGSTDCALL* SWIG_CSharpExceptionArgumentCallback_t)(const char *, const char *);

typedef struct {
  SWIG_CSharpExceptionCodes code;
  SWIG_CSharpExceptionCallback_t callback;
} SWIG_CSharpException_t;

typedef struct {
  SWIG_CSharpExceptionArgumentCodes code;
  SWIG_CSharpExceptionArgumentCallback_t callback;
} SWIG_CSharpExceptionArgument_t;

static SWIG_CSharpException_t SWIG_csharp_exceptions[] = {
  { SWIG_CSharpApplicationException, NULL },
  { SWIG_CSharpArithmeticException, NULL },
  { SWIG_CSharpDivideByZeroException, NULL },
  { SWIG_CSharpIndexOutOfRangeException, NULL },
  { SWIG_CSharpInvalidCastException, NULL },
  { SWIG_CSharpInvalidOperationException, NULL },
  { SWIG_CSharpIOException, NULL },
  { SWIG_CSharpNullReferenceException, NULL },
  { SWIG_CSharpOutOfMemoryException, NULL },
  { SWIG_CSharpOverflowException, NULL },
  { SWIG_CSharpSystemException, NULL }
};

static SWIG_CSharpExceptionArgument_t SWIG_csharp_exceptions_argument[] = {
  { SWIG_CSharpArgumentException, NULL },
  { SWIG_CSharpArgumentNullException, NULL },
  { SWIG_CSharpArgumentOutOfRangeException, NULL }
};

static void SWIGUNUSED SWIG_CSharpSetPendingException(SWIG_CSharpExceptionCodes code, const char *msg) {
  SWIG_CSharpExceptionCallback_t callback = SWIG_csharp_exceptions[SWIG_CSharpApplicationException].callback;
  if ((size_t)code < sizeof(SWIG_csharp_exceptions)/sizeof(SWIG_CSharpException_t)) {
    callback = SWIG_csharp_exceptions[code].callback;
  }
  callback(msg);
}

static void SWIGUNUSED SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpExceptionArgumentCodes code, const char *msg, const char *param_name) {
  SWIG_CSharpExceptionArgumentCallback_t callback = SWIG_csharp_exceptions_argument[SWIG_CSharpArgumentException].callback;
  if ((size_t)code < sizeof(SWIG_csharp_exceptions_argument)/sizeof(SWIG_CSharpExceptionArgument_t)) {
    callback = SWIG_csharp_exceptions_argument[code].callback;
  }
  callback(msg, param_name);
}
%}

%insert(runtime) %{
#ifdef __cplusplus
extern "C" 
#endif
SWIGEXPORT void SWIGSTDCALL SWIGRegisterExceptionCallbacks_$module(
                                                SWIG_CSharpExceptionCallback_t applicationCallback,
                                                SWIG_CSharpExceptionCallback_t arithmeticCallback,
                                                SWIG_CSharpExceptionCallback_t divideByZeroCallback, 
                                                SWIG_CSharpExceptionCallback_t indexOutOfRangeCallback, 
                                                SWIG_CSharpExceptionCallback_t invalidCastCallback,
                                                SWIG_CSharpExceptionCallback_t invalidOperationCallback,
                                                SWIG_CSharpExceptionCallback_t ioCallback,
                                                SWIG_CSharpExceptionCallback_t nullReferenceCallback,
                                                SWIG_CSharpExceptionCallback_t outOfMemoryCallback, 
                                                SWIG_CSharpExceptionCallback_t overflowCallback, 
                                                SWIG_CSharpExceptionCallback_t systemCallback) {
  SWIG_csharp_exceptions[SWIG_CSharpApplicationException].callback = applicationCallback;
  SWIG_csharp_exceptions[SWIG_CSharpArithmeticException].callback = arithmeticCallback;
  SWIG_csharp_exceptions[SWIG_CSharpDivideByZeroException].callback = divideByZeroCallback;
  SWIG_csharp_exceptions[SWIG_CSharpIndexOutOfRangeException].callback = indexOutOfRangeCallback;
  SWIG_csharp_exceptions[SWIG_CSharpInvalidCastException].callback = invalidCastCallback;
  SWIG_csharp_exceptions[SWIG_CSharpInvalidOperationException].callback = invalidOperationCallback;
  SWIG_csharp_exceptions[SWIG_CSharpIOException].callback = ioCallback;
  SWIG_csharp_exceptions[SWIG_CSharpNullReferenceException].callback = nullReferenceCallback;
  SWIG_csharp_exceptions[SWIG_CSharpOutOfMemoryException].callback = outOfMemoryCallback;
  SWIG_csharp_exceptions[SWIG_CSharpOverflowException].callback = overflowCallback;
  SWIG_csharp_exceptions[SWIG_CSharpSystemException].callback = systemCallback;
}

#ifdef __cplusplus
extern "C" 
#endif
SWIGEXPORT void SWIGSTDCALL SWIGRegisterExceptionArgumentCallbacks_$module(
                                                SWIG_CSharpExceptionArgumentCallback_t argumentCallback,
                                                SWIG_CSharpExceptionArgumentCallback_t argumentNullCallback,
                                                SWIG_CSharpExceptionArgumentCallback_t argumentOutOfRangeCallback) {
  SWIG_csharp_exceptions_argument[SWIG_CSharpArgumentException].callback = argumentCallback;
  SWIG_csharp_exceptions_argument[SWIG_CSharpArgumentNullException].callback = argumentNullCallback;
  SWIG_csharp_exceptions_argument[SWIG_CSharpArgumentOutOfRangeException].callback = argumentOutOfRangeCallback;
}
%}

%pragma(csharp) imclasscode=%{
  internal class SWIGExceptionHelper {
    [global::System.Runtime.InteropServices.DllImport("$dllimport", EntryPoint="SWIGRegisterExceptionCallbacks_$module")]
    public static extern void SWIGRegisterExceptionCallbacks_$module(
                                ExceptionDelegate applicationDelegate,
                                ExceptionDelegate arithmeticDelegate,
                                ExceptionDelegate divideByZeroDelegate, 
                                ExceptionDelegate indexOutOfRangeDelegate, 
                                ExceptionDelegate invalidCastDelegate,
                                ExceptionDelegate invalidOperationDelegate,
                                ExceptionDelegate ioDelegate,
                                ExceptionDelegate nullReferenceDelegate,
                                ExceptionDelegate outOfMemoryDelegate, 
                                ExceptionDelegate overflowDelegate, 
                                ExceptionDelegate systemExceptionDelegate);

    [global::System.Runtime.InteropServices.DllImport("$dllimport", EntryPoint="SWIGRegisterExceptionArgumentCallbacks_$module")]
    public static extern void SWIGRegisterExceptionCallbacksArgument_$module(
                                ExceptionArgumentDelegate argumentDelegate,
                                ExceptionArgumentDelegate argumentNullDelegate,
                                ExceptionArgumentDelegate argumentOutOfRangeDelegate);
%}
#if defined(SWIG_CSHARP_MONO_AOT_COMPATIBILITY)
%pragma(csharp) imclasscode=%{
    public delegate void ExceptionDelegate(global::System.IntPtr message); 
    public delegate void ExceptionArgumentDelegate(global::System.IntPtr message, global::System.IntPtr paramName);
   
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingApplicationException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.ApplicationException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingArithmeticException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.ArithmeticException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingDivideByZeroException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.DivideByZeroException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingIndexOutOfRangeException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.IndexOutOfRangeException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingInvalidCastException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.InvalidCastException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingInvalidOperationException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.InvalidOperationException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingIOException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.IO.IOException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingNullReferenceException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.NullReferenceException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingOutOfMemoryException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.OutOfMemoryException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingOverflowException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.OverflowException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionDelegate))]
    static void SetPendingSystemException(global::System.IntPtr message) {
      SWIGPendingException.Set(new global::System.SystemException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionArgumentDelegate))]
    static void SetPendingArgumentException(global::System.IntPtr message, global::System.IntPtr paramName) {
      SWIGPendingException.Set(new global::System.ArgumentException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message), global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(paramName), SWIGPendingException.Retrieve()));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionArgumentDelegate))]
    static void SetPendingArgumentNullException(global::System.IntPtr message, global::System.IntPtr paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      string message_text = global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message);
      if (e != null) message_text += " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentNullException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(paramName), message_text));
    }
    [$imclassname.MonoPInvokeCallback(typeof(ExceptionArgumentDelegate))]
    static void SetPendingArgumentOutOfRangeException(global::System.IntPtr message, global::System.IntPtr paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      string message_text = global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(message);
      if (e != null) message_text += " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentOutOfRangeException(global::System.Runtime.InteropServices.Marshal.PtrToStringAnsi(paramName), message_text));
    }
    static SWIGExceptionHelper() {
      SWIGRegisterExceptionCallbacks_$module(
        SetPendingApplicationException,
        SetPendingArithmeticException,
        SetPendingDivideByZeroException,
        SetPendingIndexOutOfRangeException,
        SetPendingInvalidCastException,
        SetPendingInvalidOperationException,
        SetPendingIOException,
        SetPendingNullReferenceException,
        SetPendingOutOfMemoryException,
        SetPendingOverflowException,
        SetPendingSystemException);
      SWIGRegisterExceptionCallbacksArgument_$module(
        SetPendingArgumentException,
        SetPendingArgumentNullException,
        SetPendingArgumentOutOfRangeException);
    }
  }
%}
#else
%pragma(csharp) imclasscode=%{
    public delegate void ExceptionDelegate(string message); 
    public delegate void ExceptionArgumentDelegate(string message, string paramName);
    static ExceptionDelegate applicationDelegate = new ExceptionDelegate(SetPendingApplicationException);
    static ExceptionDelegate arithmeticDelegate = new ExceptionDelegate(SetPendingArithmeticException);
    static ExceptionDelegate divideByZeroDelegate = new ExceptionDelegate(SetPendingDivideByZeroException);
    static ExceptionDelegate indexOutOfRangeDelegate = new ExceptionDelegate(SetPendingIndexOutOfRangeException);
    static ExceptionDelegate invalidCastDelegate = new ExceptionDelegate(SetPendingInvalidCastException);
    static ExceptionDelegate invalidOperationDelegate = new ExceptionDelegate(SetPendingInvalidOperationException);
    static ExceptionDelegate ioDelegate = new ExceptionDelegate(SetPendingIOException);
    static ExceptionDelegate nullReferenceDelegate = new ExceptionDelegate(SetPendingNullReferenceException);
    static ExceptionDelegate outOfMemoryDelegate = new ExceptionDelegate(SetPendingOutOfMemoryException);
    static ExceptionDelegate overflowDelegate = new ExceptionDelegate(SetPendingOverflowException);
    static ExceptionDelegate systemDelegate = new ExceptionDelegate(SetPendingSystemException);

    static ExceptionArgumentDelegate argumentDelegate = new ExceptionArgumentDelegate(SetPendingArgumentException);
    static ExceptionArgumentDelegate argumentNullDelegate = new ExceptionArgumentDelegate(SetPendingArgumentNullException);
    static ExceptionArgumentDelegate argumentOutOfRangeDelegate = new ExceptionArgumentDelegate(SetPendingArgumentOutOfRangeException);

    static void SetPendingApplicationException(string message) {
      SWIGPendingException.Set(new global::System.ApplicationException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingArithmeticException(string message) {
      SWIGPendingException.Set(new global::System.ArithmeticException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingDivideByZeroException(string message) {
      SWIGPendingException.Set(new global::System.DivideByZeroException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingIndexOutOfRangeException(string message) {
      SWIGPendingException.Set(new global::System.IndexOutOfRangeException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingInvalidCastException(string message) {
      SWIGPendingException.Set(new global::System.InvalidCastException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingInvalidOperationException(string message) {
      SWIGPendingException.Set(new global::System.InvalidOperationException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingIOException(string message) {
      SWIGPendingException.Set(new global::System.IO.IOException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingNullReferenceException(string message) {
      SWIGPendingException.Set(new global::System.NullReferenceException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingOutOfMemoryException(string message) {
      SWIGPendingException.Set(new global::System.OutOfMemoryException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingOverflowException(string message) {
      SWIGPendingException.Set(new global::System.OverflowException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingSystemException(string message) {
      SWIGPendingException.Set(new global::System.SystemException(message, SWIGPendingException.Retrieve()));
    }

    static void SetPendingArgumentException(string message, string paramName) {
      SWIGPendingException.Set(new global::System.ArgumentException(message, paramName, SWIGPendingException.Retrieve()));
    }

    static void SetPendingArgumentNullException(string message, string paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      if (e != null) message = message + " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentNullException(paramName, message));
    }

    static void SetPendingArgumentOutOfRangeException(string message, string paramName) {
      global::System.Exception e = SWIGPendingException.Retrieve();
      if (e != null) message = message + " Inner Exception: " + e.Message;
      SWIGPendingException.Set(new global::System.ArgumentOutOfRangeException(paramName, message));
    }
    static SWIGExceptionHelper() {
      SWIGRegisterExceptionCallbacks_$module(
                                applicationDelegate,
                                arithmeticDelegate,
                                divideByZeroDelegate,
                                indexOutOfRangeDelegate,
                                invalidCastDelegate,
                                invalidOperationDelegate,
                                ioDelegate,
                                nullReferenceDelegate,
                                outOfMemoryDelegate,
                                overflowDelegate,
                                systemDelegate);

      SWIGRegisterExceptionCallbacksArgument_$module(
                                argumentDelegate,
                                argumentNullDelegate,
                                argumentOutOfRangeDelegate);
    }
  }
  protected static SWIGExceptionHelper swigExceptionHelper = new SWIGExceptionHelper();
%}
#endif
%pragma(csharp) imclasscode=%{

  public class SWIGPendingException {
    [global::System.ThreadStatic]
    private static global::System.Exception pendingException = null;
    private static int numExceptionsPending = 0;
    private static global::System.Object exceptionsLock = null;

    public static bool Pending {
      get {
        bool pending = false;
        if (numExceptionsPending > 0)
          if (pendingException != null)
            pending = true;
        return pending;
      } 
    }

    public static void Set(global::System.Exception e) {
      if (pendingException != null)
        throw new global::System.ApplicationException("FATAL: An earlier pending exception from unmanaged code was missed and thus not thrown (" + pendingException.ToString() + ")", e);
      pendingException = e;
      lock(exceptionsLock) {
        numExceptionsPending++;
      }
    }

    public static global::System.Exception Retrieve() {
      global::System.Exception e = null;
      if (numExceptionsPending > 0) {
        if (pendingException != null) {
          e = pendingException;
          pendingException = null;
          lock(exceptionsLock) {
            numExceptionsPending--;
          }
        }
      }
      return e;
    }

    static SWIGPendingException() {
      exceptionsLock = new global::System.Object();
    }
  }
%}
#else // SWIG_CSHARP_NO_EXCEPTION_HELPER

%insert(runtime) %{
typedef enum {
  SWIG_CSharpApplicationException,
  SWIG_CSharpArithmeticException,
  SWIG_CSharpDivideByZeroException,
  SWIG_CSharpIndexOutOfRangeException,
  SWIG_CSharpInvalidCastException,
  SWIG_CSharpInvalidOperationException,
  SWIG_CSharpIOException,
  SWIG_CSharpNullReferenceException,
  SWIG_CSharpOutOfMemoryException,
  SWIG_CSharpOverflowException,
  SWIG_CSharpSystemException
} SWIG_CSharpExceptionCodes;

  typedef enum {
  SWIG_CSharpArgumentException,
  SWIG_CSharpArgumentNullException,
  SWIG_CSharpArgumentOutOfRangeException
} SWIG_CSharpExceptionArgumentCodes;

static void SWIGUNUSED SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpExceptionArgumentCodes code, const char *msg, const char *param_name) {
}
%}
#endif // SWIG_CSHARP_NO_EXCEPTION_HELPER


#if defined(SWIG_CSHARP_MONO_AOT_COMPATIBILITY)
%pragma(csharp) imclasscode=%{
  public class SWIGGCHandleHelper{
    public delegate void SwigFreeDelegate(global::System.IntPtr ptr);
    
    [$imclassname.MonoPInvokeCallback(typeof(SwigFreeDelegate))]
    static void SwigFree(global::System.IntPtr ptr) {
      System.Runtime.InteropServices.GCHandle.FromIntPtr(ptr).Free();
    }

    static SWIGGCHandleHelper(){
      SWIGRegisterGCHandleFreeCallback_$module(SwigFree);
    }

    [global::System.Runtime.InteropServices.DllImport("$dllimport", EntryPoint="SWIGRegisterGCHandleFreeCallback_$module")]
    public static extern void SWIGRegisterGCHandleFreeCallback_$module(SwigFreeDelegate freeDelegate);
  }
%}


%insert(runtime) %{
typedef void (SWIGSTDCALL* SWIG_CSharpGCHandleFreeCallback)(void*); 
SWIG_CSharpGCHandleFreeCallback SWIG_csharp_gchandle_free_callback_$module = NULL;

#ifdef __cplusplus
extern "C" 
#endif
SWIGEXPORT void SWIGSTDCALL SWIGRegisterGCHandleFreeCallback_$module(SWIG_CSharpGCHandleFreeCallback callback) {
  SWIG_csharp_gchandle_free_callback_$module = callback;
}
%}
#endif


#if !defined(SWIG_CSHARP_NO_STRING_HELPER)
#if !defined(SWIG_CSHARP_MONO_AOT_COMPATIBILITY)
%insert(runtime) %{
/* Callback for returning strings to C# without leaking memory */
typedef char * (SWIGSTDCALL* SWIG_CSharpStringHelperCallback)(const char *);
static SWIG_CSharpStringHelperCallback SWIG_csharp_string_callback = NULL;
%}

%pragma(csharp) imclasscode=%{
  protected class SWIGStringHelper {
    public delegate string SWIGStringDelegate(string message);
    static SWIGStringDelegate stringDelegate = new SWIGStringDelegate(CreateString);

    [global::System.Runtime.InteropServices.DllImport("$dllimport", EntryPoint="SWIGRegisterStringCallback_$module")]
    public static extern void SWIGRegisterStringCallback_$module(SWIGStringDelegate stringDelegate);

    static string CreateString(string cString) {
      return cString;
    }

    static SWIGStringHelper() {
      SWIGRegisterStringCallback_$module(stringDelegate);
    }
  }

  static protected SWIGStringHelper swigStringHelper = new SWIGStringHelper();
%}

%insert(runtime) %{
#ifdef __cplusplus
extern "C" 
#endif
SWIGEXPORT void SWIGSTDCALL SWIGRegisterStringCallback_$module(SWIG_CSharpStringHelperCallback callback) {
  SWIG_csharp_string_callback = callback;
}
%}
#endif // SWIG_CSHARP_MONO_AOT_COMPATIBILITY
#endif // SWIG_CSHARP_NO_STRING_HELPER

#if !defined(SWIG_CSHARP_NO_IMCLASS_STATIC_CONSTRUCTOR)
// Ensure the class is not marked beforefieldinit
%pragma(csharp) imclasscode=%{
  static $imclassname() {
  }
%}
#endif

%insert(runtime) %{
/* Contract support */

#define SWIG_contract_assert(nullreturn, expr, msg) if (!(expr)) {SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpArgumentOutOfRangeException, msg, ""); return nullreturn; } else
%}
