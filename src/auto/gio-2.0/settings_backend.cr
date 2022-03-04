require "../g_object-2.0/object"

module Gio
  # The #GSettingsBackend interface defines a generic interface for
  # non-strictly-typed data that is stored in a hierarchy. To implement
  # an alternative storage backend for #GSettings, you need to implement
  # the #GSettingsBackend interface and then make it implement the
  # extension point #G_SETTINGS_BACKEND_EXTENSION_POINT_NAME.
  #
  # The interface defines methods for reading and writing values, a
  # method for determining if writing of certain values will fail
  # (lockdown) and a change notification mechanism.
  #
  # The semantics of the interface are very precisely defined and
  # implementations must carefully adhere to the expectations of
  # callers that are documented on each of the interface methods.
  #
  # Some of the #GSettingsBackend functions accept or return a #GTree.
  # These trees always have strings as keys and #GVariant as values.
  # g_settings_backend_create_tree() is a convenience function to create
  # suitable trees.
  #
  # The #GSettingsBackend API is exported to allow third-party
  # implementations, but does not carry the same stability guarantees
  # as the public GIO API. For this reason, you have to define the
  # C preprocessor symbol %G_SETTINGS_ENABLE_BACKEND before including
  # `gio/gsettingsbackend.h`.
  class SettingsBackend < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_backend_get_type
    end

    def self.flatten_tree(tree : GLib::Tree, path : ::String, keys : Enumerable(::String)) : Nil
      # g_settings_backend_flatten_tree: (None)
      # @path: (out) (transfer full)
      # @keys: (out) (transfer container) (array zero-terminated=1 element-type Utf8)
      # @values: (out) (transfer container) (optional) (array zero-terminated=1 element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      values = Pointer(Pointer(Pointer(Void))).null
      keys = keys.to_a.map(&.to_unsafe).to_unsafe

      values = values.to_a.map { |_i| GLib::Variant.new(_i).to_unsafe }.to_unsafe

      # C call
      LibGio.g_settings_backend_flatten_tree(tree, path, keys, values)

      # Return value handling
    end

    def self.default : Gio::SettingsBackend
      # g_settings_backend_get_default: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_settings_backend_get_default

      # Return value handling
      Gio::SettingsBackend.new(_retval, GICrystal::Transfer::Full)
    end

    def changed(key : ::String, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_changed: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_changed(self, key, origin_tag)

      # Return value handling
    end

    def changed_tree(tree : GLib::Tree, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_changed_tree: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_changed_tree(self, tree, origin_tag)

      # Return value handling
    end

    def keys_changed(path : ::String, items : Enumerable(::String), origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_keys_changed: (Method)
      # @items: (array zero-terminated=1 element-type Utf8)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end
      items = items.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_settings_backend_keys_changed(self, path, items, origin_tag)

      # Return value handling
    end

    def path_changed(path : ::String, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_path_changed: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_path_changed(self, path, origin_tag)

      # Return value handling
    end

    def path_writable_changed(path : ::String) : Nil
      # g_settings_backend_path_writable_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_backend_path_writable_changed(self, path)

      # Return value handling
    end

    def writable_changed(key : ::String) : Nil
      # g_settings_backend_writable_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_settings_backend_writable_changed(self, key)

      # Return value handling
    end
  end
end
