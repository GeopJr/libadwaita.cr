require "../g_object-2.0/object"
require "./builder_scope"

module Gtk
  # A `GtkBuilderScope` implementation for the C language.
  #
  # `GtkBuilderCScope` instances use symbols explicitly added to @builder
  # with prior calls to [method@Gtk.BuilderCScope.add_callback_symbol].
  # If developers want to do that, they are encouraged to create their
  # own scopes for that purpose.
  #
  # In the case that symbols are not explicitly added; GTK will uses
  # `GModule`’s introspective features (by opening the module %NULL) to
  # look at the application’s symbol table. From here it tries to match
  # the signal function names given in the interface description with
  # symbols in the application.
  #
  # Note that unless [method@Gtk.BuilderCScope.add_callback_symbol] is
  # called for all signal callbacks which are referenced by the loaded XML,
  # this functionality will require that `GModule` be supported on the platform.
  class BuilderCScope < GObject::Object
    include BuilderScope

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_builder_cscope_get_type
    end

    def initialize
      # gtk_builder_cscope_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_builder_cscope_new

      # Return value handling
      @pointer = _retval
    end

    def add_callback_symbol(callback_name : ::String, callback_symbol : Pointer(Void)) : Nil
      # gtk_builder_cscope_add_callback_symbol: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_builder_cscope_add_callback_symbol(self, callback_name, callback_symbol)

      # Return value handling
    end
  end
end
