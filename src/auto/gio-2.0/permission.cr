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
  class Permission < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allowed : Bool? = nil, can_acquire : Bool? = nil, can_release : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if allowed
        (_names.to_unsafe + _n).value = "allowed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed)
        _n += 1
      end
      if can_acquire
        (_names.to_unsafe + _n).value = "can-acquire".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_acquire)
        _n += 1
      end
      if can_release
        (_names.to_unsafe + _n).value = "can-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_release)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Permission.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_permission_get_type
    end

    def acquire(cancellable : Gio::Cancellable?) : Bool
      # g_permission_acquire: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_permission_acquire(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def acquire_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_permission_acquire_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_permission_acquire_async(self, cancellable, callback, user_data)
    end

    def acquire_finish(result : Gio::AsyncResult) : Bool
      # g_permission_acquire_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_permission_acquire_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def allowed? : Bool
      # g_permission_get_allowed: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_permission_get_allowed(self)
      GICrystal.to_bool(_retval)
    end

    def can_acquire? : Bool
      # g_permission_get_can_acquire: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_permission_get_can_acquire(self)
      GICrystal.to_bool(_retval)
    end

    def can_release? : Bool
      # g_permission_get_can_release: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_permission_get_can_release(self)
      GICrystal.to_bool(_retval)
    end

    def impl_update(allowed : Bool, can_acquire : Bool, can_release : Bool) : Nil
      # g_permission_impl_update: (Method)
      # Returns: (transfer none)

      LibGio.g_permission_impl_update(self, allowed, can_acquire, can_release)
    end

    def release(cancellable : Gio::Cancellable?) : Bool
      # g_permission_release: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_permission_release(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def release_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_permission_release_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_permission_release_async(self, cancellable, callback, user_data)
    end

    def release_finish(result : Gio::AsyncResult) : Bool
      # g_permission_release_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_permission_release_finish(self, result)
      GICrystal.to_bool(_retval)
    end
  end
end
