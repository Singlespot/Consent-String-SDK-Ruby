require 'set'
require 'date'
require 'iab_consent_string/bits'
require 'iab_consent_string/gdpr_constants'
require 'iab_consent_string/consent/vendor_consent'

module IABConsentString
  module Consent
    module Implementation
      module V2
        module ByteBufferBackedDiscloedVendorConsent
          def getDisclosedVendor
            parser = IABConsentString::Consent::Implementation::V2::VendorSectionParser.new(@bits_disclosed_vendors, IABConsentString::GDPRConstantsV2::Segment::VENDOR_START_SECTION_OFFSET)
            vendor_consent = parser.parse
            vendor_consent
          end 

          def isDisclosedVendor(id)
            self.getDisclosedVendor.isVendorConsented(id)
          end
        end
      end
    end
  end
end
