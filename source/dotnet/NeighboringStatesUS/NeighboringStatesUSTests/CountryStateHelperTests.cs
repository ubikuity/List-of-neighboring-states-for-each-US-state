using NeighboringStatesUS;
using System.Collections.Generic;
using System.Linq;
using Xunit;
using Xunit.Abstractions;

namespace NeighboringStatesUSTests
{
    public class CountryStateHelperTests
    {

        private readonly ITestOutputHelper output;
        private const int NbOfCountryStates = 51;

        public CountryStateHelperTests(ITestOutputHelper output)
        {
            this.output = output;
        }

        [Fact]
        public void GetCountryStatesTest()
        {
            // Act
            var result = CountryStateHelper.GetCountryStates();
            // Assert
            Assert.Equal(result.Count, NbOfCountryStates);
        }

        [Fact]
        public void GetCountryStatesTestCodeNotNull()
        {
            // Act
            var result = CountryStateHelper.GetCountryStates();
            // Assert
            Assert.NotNull(result.First().Code);
        }

        [Fact]
        public void GetAllNeighboringStatesTest()
        {
            // Act
            var result = CountryStateHelper.GetAllNeighboringStates();
            // Assert
            Assert.Equal(result.Count, NbOfCountryStates);
        }

        [Fact]
        public void GetAllNeighboringStatesSortedNeighborsTest()
        {
            // Act
            var result = CountryStateHelper.GetAllNeighboringStates();
            // Assert
            foreach (var countryState in result)
            {
                Assert.Equal(countryState.NeighborCodes, countryState.NeighborCodes.OrderBy(x => x));
                output.WriteLine(countryState.NeighborCodes.Count + " neighbor states for " + countryState.Code);
            }
        }


        [Fact]
        public void GetNeighboringStatesInvalidState()
        {
            const string InvalidCountryState = "XX";
            // Act
            var result = CountryStateHelper.GetNeighboringStates(InvalidCountryState);
            // Assert
            Assert.Null(result);
        }

        [Fact]
        public void GetNeighboringStatesMissouriTest()
        {
            const string CountryStateCodeMissouri = "MO";
            List<string> NeighborStatesMissouri = new List<string> { "AR", "IA", "IL", "KS", "KY", "NE", "OK", "TN" };
            // Act
            var result = CountryStateHelper.GetNeighboringStates(CountryStateCodeMissouri);
            // Assert
            Assert.Equal(result.NeighborCodes, NeighborStatesMissouri);
        }
    }
}
