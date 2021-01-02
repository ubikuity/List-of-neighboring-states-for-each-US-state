using Microsoft.Extensions.FileProviders;
using NeighboringStatesUS.DTO;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.Json;

namespace NeighboringStatesUS
{
    public static class CountryStateHelper
    {
        private const string CountryStatesJsonFilename = "us-states.json";
        private const string NeighborStatesJsonFilename = "neighbor-states.json";

        private static JsonSerializerOptions GetJsonSerializerOptions()
        {
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            };
            return options;
        }

        public static List<CountryState> GetCountryStates()
        {
            var embeddedProvider = new EmbeddedFileProvider(Assembly.GetExecutingAssembly());
            using (var stream = embeddedProvider.GetFileInfo(CountryStatesJsonFilename).CreateReadStream())
            using (var reader = new StreamReader(stream))
            {
                string jsonFileContent = reader.ReadToEnd();
                var jsonSerializerOptions = GetJsonSerializerOptions();
                var countryStates = JsonSerializer.Deserialize<List<CountryState>>(jsonFileContent, jsonSerializerOptions);
                return countryStates;
            }
        }

        public static List<CountryStateNeighbor> GetAllNeighboringStates()
        {
            var embeddedProvider = new EmbeddedFileProvider(Assembly.GetExecutingAssembly());
            using (var stream = embeddedProvider.GetFileInfo(NeighborStatesJsonFilename).CreateReadStream())
            using (var reader = new StreamReader(stream))
            {
                string jsonFileContent = reader.ReadToEnd();
                var jsonSerializerOptions = GetJsonSerializerOptions();
                var neighborStates = JsonSerializer.Deserialize<List<CountryStateNeighbor>>(jsonFileContent, jsonSerializerOptions);
                return neighborStates;
            }
        }

        public static CountryStateNeighbor GetNeighboringStates(string CountryStateCode)
        {
            var allNeighborStates = GetAllNeighboringStates();
            var neighborStates = allNeighborStates.Where(x => x.Code == CountryStateCode).FirstOrDefault();
            return neighborStates;
        }
    }
}
