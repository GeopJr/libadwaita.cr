require "../g_object-2.0/object"

module Gio
  # A #GPermission represents the status of the caller's permission to
  # perform a certain action.
  #
  # You can query if the action is currently allowed and if it is
  # possible to acquire the permission so that the action will be allowed
  # in the future.
  #
  # There is also an API to actually acquire the permission and one to
  # release it.
  #
  # As an example, a #GPermission might represent the ability for the
  # user to write to a #GSettings object.  This #GPermission object could
  # then be used to decide if it is appropriate to show a "Click here to
  # unlock" button in a dialog and to provide the mechanism to invoke
  # when that button is clicked.
  @[GObject::GeneratedWrapper]
  class Permission < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::PermissionClass), class_init,
        sizeof(LibGio::Permission), instance_init, 0)
    end

    GICrystal.define_new_method(Permission, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Permission`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allowed : Bool? = nil, can_acquire : Bool? = nil, can_release : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !allowed.nil?
        (_names.to_unsafe + _n).value = "allowed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed)
        _n += 1
      end
      if !can_acquire.nil?
        (_names.to_unsafe + _n).value = "can-acquire".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_acquire)
        _n += 1
      end
      if !can_release.nil?
        (_names.to_unsafe + _n).value = "can-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_release)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Permission.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_permission_get_type
    end

    def allowed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allowed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_acquire? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-acquire", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_release? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-release", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Attempts to acquire the permission represented by @permission.
    #
    # The precise method by which this happens depends on the permission
    # and the underlying authentication mechanism.  A simple example is
    # that a dialog may appear asking the user to enter their password.
    #
    # You should check with g_permission_get_can_acquire() before calling
    # this function.
    #
    # If the permission is acquired then %TRUE is returned.  Otherwise,
    # %FALSE is returned and @error is set appropriately.
    #
    # This call is blocking, likely for a very long time (in the case that
    # user interaction is required).  See g_permission_acquire_async() for
    # the non-blocking version.
    def acquire(cancellable : Gio::Cancellable?) : Bool
      # g_permission_acquire: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_permission_acquire(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Attempts to acquire the permission represented by @permission.
    #
    # This is the first half of the asynchronous version of
    # g_permission_acquire().
    def acquire_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_permission_acquire_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_permission_acquire_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Collects the result of attempting to acquire the permission
    # represented by @permission.
    #
    # This is the second half of the asynchronous version of
    # g_permission_acquire().
    def acquire_finish(result : Gio::AsyncResult) : Bool
      # g_permission_acquire_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_permission_acquire_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of the 'allowed' property.  This property is %TRUE if
    # the caller currently has permission to perform the action that
    # @permission represents the permission to perform.
    def allowed : Bool
      # g_permission_get_allowed: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_permission_get_allowed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of the 'can-acquire' property.  This property is %TRUE
    # if it is generally possible to acquire the permission by calling
    # g_permission_acquire().
    def can_acquire : Bool
      # g_permission_get_can_acquire: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_permission_get_can_acquire(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of the 'can-release' property.  This property is %TRUE
    # if it is generally possible to release the permission by calling
    # g_permission_release().
    def can_release : Bool
      # g_permission_get_can_release: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_permission_get_can_release(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This function is called by the #GPermission implementation to update
    # the properties of the permission.  You should never call this
    # function except from a #GPermission implementation.
    #
    # GObject notify signals are generated, as appropriate.
    def impl_update(allowed : Bool, can_acquire : Bool, can_release : Bool) : Nil
      # g_permission_impl_update: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_permission_impl_update(@pointer, allowed, can_acquire, can_release)

      # Return value handling
    end

    # Attempts to release the permission represented by @permission.
    #
    # The precise method by which this happens depends on the permission
    # and the underlying authentication mechanism.  In most cases the
    # permission will be dropped immediately without further action.
    #
    # You should check with g_permission_get_can_release() before calling
    # this function.
    #
    # If the permission is released then %TRUE is returned.  Otherwise,
    # %FALSE is returned and @error is set appropriately.
    #
    # This call is blocking, likely for a very long time (in the case that
    # user interaction is required).  See g_permission_release_async() for
    # the non-blocking version.
    def release(cancellable : Gio::Cancellable?) : Bool
      # g_permission_release: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_permission_release(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Attempts to release the permission represented by @permission.
    #
    # This is the first half of the asynchronous version of
    # g_permission_release().
    def release_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_permission_release_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_permission_release_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Collects the result of attempting to release the permission
    # represented by @permission.
    #
    # This is the second half of the asynchronous version of
    # g_permission_release().
    def release_finish(result : Gio::AsyncResult) : Bool
      # g_permission_release_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_permission_release_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
